import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';
import 'package:travel_hotel_app/provider/motels.dart';
import 'package:travel_hotel_app/screens/hotel_detail_screen.dart';

class MasonryGrid extends StatelessWidget {
  const MasonryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final motels = Provider.of<MotelProvider>(context).getMotelList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Consumer<MotelProvider>(
          builder: (context, motelState, _) =>
              motelState.motelList.isEmpty
                  ? Container(
                      height: 100.0,
                      child: const Center(
                        child: Text(
                            "Không có dữ liệu",
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.grey
                            ),
                        ),
                      )
                  )
                  : StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemCount: motelState.motelList.length,
                    crossAxisCount: 4,
                    itemBuilder: (context, index) => MasonryGridItem(motelState.motelList[index]),
                    staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
                  ),
      ),
    );
  }
}

class MasonryGridItem extends StatelessWidget {
  final Motel motel;
  const MasonryGridItem(this.motel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HotelDetailScreen(motel)
          ),
        );
      },
      child: Container(
        height: motel.height,
        alignment:  Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(
              motel.imageUrl,
            ),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                motel.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                motel.address,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
