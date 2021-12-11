class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/image9.jpg',
    name: 'Tatarasuma',
    address: 'Inazuma Teyvat',
    price: 124,
  ),
  Hotel(
    imageUrl: 'assets/images/image10.jpg',
    name: 'Seirai',
    address: 'Inazuma Teyvat',
    price: 124,
  ),
  Hotel(
    imageUrl: 'assets/images/image11.jpg',
    name: 'Narukami',
    address: 'Inazuma Teyvat',
    price: 124,
  ),
  Hotel(
    imageUrl: 'assets/images/image12.jfif',
    name: 'Yashiro',
    address: 'Inazuma Teyvat',
    price: 124,
  ),
];