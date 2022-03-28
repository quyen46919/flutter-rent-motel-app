import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MiniMap extends StatelessWidget {
  double latitude;
  double longtitude;
  String title;
  MiniMap({ this.latitude = 16.0323, this.longtitude = 108.2211, this.title = 'Vị trí nhà trọ' });

  late GoogleMapController _googleMapController;

  late final Marker _origin = Marker(
    markerId: const MarkerId('DONG_A_University'),
    infoWindow: InfoWindow(
      title: title,
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: LatLng(latitude, longtitude),
  );

  final CameraPosition _initialCameraPosition = const CameraPosition(
      target: LatLng(16.0323, 108.2211),
      zoom: 13
  );

  void _autoZoomToTarget() {
    _googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(latitude, longtitude),
                zoom: 14
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
        child: const Icon(Icons.center_focus_strong, color: Colors.white),
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(latitude, longtitude),
                zoom: 14
              )
            )
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: GoogleMap(
        initialCameraPosition: latitude != 0.0
            ? CameraPosition(
                target: LatLng(latitude, longtitude),
                zoom: 14
            )
            : _initialCameraPosition,
        myLocationButtonEnabled: false,
        onMapCreated: (GoogleMapController controller) => _googleMapController = controller,
        markers: {_origin},
      ),
    );
  }
}
