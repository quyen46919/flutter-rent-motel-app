import 'package:travel_hotel_app/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities
});
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/hoanghon.jpg',
    name: 'Beautiful sunset in Kyoto Japan',
    type: 'VietNam tour',
    startTimes: ['9:30 am', '16:30 pm'],
    rating: 5,
    price: 30
  ),
  Activity(
      imageUrl: 'assets/images/image2.jpg',
      name: 'Beautiful castel in unknown country on Spacific Ocean',
      type: 'Genshin impact',
      startTimes: ['3:30 am', '5:30 pm'],
      rating: 4,
      price: 29
  ),
  Activity(
      imageUrl: 'assets/images/image3.jpg',
      name: 'image 3',
      type: 'Genshin impact',
      startTimes: ['4:30 am', '12:30 pm'],
      rating: 5,
      price: 12
  ),
  Activity(
      imageUrl: 'assets/images/image4.jpg',
      name: 'image 4',
      type: 'Genshin impact',
      startTimes: ['1:30 am', '4:30 pm'],
      rating: 3,
      price: 21
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/image5.jpg',
    city: 'Mondstad',
    country: 'Teyvat',
    description: 'This is very long description for this destination',
    activities: activities
  ),
  Destination(
      imageUrl: 'assets/images/image6.jpg',
      city: 'Narukami',
      country: 'Teyvat',
      description: 'This is very long description for this destination',
      activities: activities
  ),
  Destination(
      imageUrl: 'assets/images/image7.jpg',
      city: 'Yashiro',
      country: 'Teyvat',
      description: 'This is very long description for this destination',
      activities: activities
  ),
  Destination(
      imageUrl: 'assets/images/image5.jpg',
      city: 'Tsurumi',
      country: 'Teyvat',
      description: 'This is very long description for this destination',
      activities: activities
  ),
];