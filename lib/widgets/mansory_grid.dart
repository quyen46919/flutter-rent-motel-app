import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';
import 'package:travel_hotel_app/screens/hotel_detail.dart';

class MasonryGrid extends StatelessWidget {
  const MasonryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        itemCount: hotels.length,
        crossAxisCount: 4,
        itemBuilder: (context, index) => MasonryGridItem(hotels[index]),
        staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
      ),
    );
  }
}

class MasonryGridItem extends StatelessWidget {
  final Hotel hotel;
  const MasonryGridItem(this.hotel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HotelDetail(hotel)
          ),
        );
      },
      child: Container(
        height: hotel.height,
        alignment:  Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(
              hotel.imageUrl,
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
                hotel.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                hotel.address,
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
