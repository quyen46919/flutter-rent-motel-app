import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';
import 'package:travel_hotel_app/models/map_marker_model.dart';
import 'package:travel_hotel_app/screens/hotel_detail_screen.dart';
import 'package:uuid/uuid.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  static const _initialCameraPosition = CameraPosition(
      target: LatLng(16.0323, 108.2211),
      zoom: 13
  );
  late GoogleMapController _googleMapController;
  var uuid = const Uuid();
  double currentZoom = 15;

  late final Marker _origin = Marker(
    markerId: const MarkerId('DONG_A_University'),
    infoWindow: InfoWindow(
        title: 'Đại học Đông Á',
        onTap: () {
          setState(() {
            _markerList.remove(_markerList.firstWhere(
                    (Marker marker) => marker.markerId.value == _origin.markerId.value)
            );
          });
        },
        anchor: const Offset(0.5, 0.5)
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(16.0323, 108.2211),
  );

  List<Marker> foo() {
    final List<MapMarker> markers = [];

    hotels.asMap().forEach((index, value) {
      markers.add(
        MapMarker(
          id: value.id,
          position: LatLng(value.latitude, value.longtitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
          infoWindow: InfoWindow(
              title: '${value.name}, ${value.address} - ${oCcy.format(value.price)}đ',
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    HotelDetailScreen(value)), (Route<dynamic> route) => false);
              },
              anchor: const Offset(0.5, 0.5)
          ),
        ),
      );
    });

    final Fluster<MapMarker> fluster = Fluster<MapMarker>(
      minZoom: 0, // The min zoom at clusters will show
      maxZoom: 19, // The max zoom at clusters will show
      radius: 150, // Cluster radius in pixels
      extent: 2048, // Tile extent. Radius is calculated with it.
      nodeSize: 64, // Size of the KD-tree leaf node.
      points: markers, // The list of markers created before
      createCluster: ( // Create cluster marker
          BaseCluster cluster,
          double lng,
          double lat,
          ) => MapMarker(
        id: cluster.id.toString(),
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        isCluster: cluster.isCluster,
        clusterId: cluster.id,
        pointsSize: cluster.pointsSize,
        childMarkerId: cluster.childMarkerId,
        infoWindow: InfoWindow(
            title: 'Tập hợp của ${cluster.pointsSize} phòng trọ',
            onTap: () {},
            anchor: const Offset(0.5, 0.5)
        ),
      ),
    );

    final List<Marker> googleMarkers = fluster
        .clusters([-180, -85, 180, 85], currentZoom.toInt())
        .map((cluster) => cluster.toMarker())
        .toList();

    return googleMarkers;
  }

  final oCcy = NumberFormat("#,###", "en_US");

  late final Set<Marker> _markerList = {
    ... hotels.map((e) {
      return Marker(
        markerId: MarkerId(uuid.v1()),
        infoWindow: InfoWindow(
          title: '${e.name}, ${e.address} - ${oCcy.format(e.price)}đ',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => HotelDetailScreen(e)
              ),
            );
          },
          anchor: const Offset(0.5, 0.5)
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        position: LatLng(e.latitude, e.longtitude),
      );
    }),
    _origin
  };

  late Marker _destination;
  // Object for PolylinePoints
  late PolylinePoints polylinePoints;
  // List of coordinates to join
  List<LatLng> polylineCoordinates = [];
  // Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};
  // Create the polylines for showing the route between two places
  Future<Polyline> _createPolylines(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude,
      ) async {
    print('Call api to get polylines information');

    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyA4h12BRnwuOh9KZk_NGDhDmzNrWjL0NMY', // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );
    print(result.errorMessage);
    print(result.status);
    print(result.points);

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    // Defining an ID
    PolylineId id = const PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    // Adding the polyline to the map
    polylines[id] = polyline;

    return polyline;
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
        child: const Icon(Icons.center_focus_strong, color: Colors.white),
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        mapToolbarEnabled: true,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _googleMapController = controller;
        },
        onCameraMove: (position) {
          setState(() {
            currentZoom = position.zoom;
          });
        },
        markers: foo().toSet(),
        polylines: Set<Polyline>.of(polylines.values),
        onTap: (LatLng latLng) {
          // if (_markerList.length != 2) {
          //   final lat = latLng.latitude;
          //   final long = latLng.longitude;
          //   _destination = Marker(
          //     markerId: MarkerId(latLng.toString()),
          //     infoWindow: InfoWindow(
          //         title: 'Click here to delete checkpoint',
          //         onTap: () {
          //           print('lat: $lat, long: $long');
          //           setState(() {
          //             _markerList.remove(_markerList.firstWhere(
          //                     (Marker marker) => marker.markerId.value == latLng.toString())
          //             );
          //           });
          //         }
          //     ),
          //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          //     position: LatLng(lat, long),
          //   );
          //   setState(() {
          //     if (_markerList.length < 2) {
          //       _markerList.add(_destination);
          //     }
          //     if (_markerList.length == 2) {
          //       _createPolylines(
          //           _markerList.elementAt(0).position.latitude,
          //           _markerList.elementAt(0).position.longitude,
          //           latLng.latitude,
          //           latLng.longitude
          //       );
          //     }
          //   });
          // };
        },
      ),
    );
  }
}
