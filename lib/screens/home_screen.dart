import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_hotel_app/widgets/destination_carousel.dart';
import 'package:travel_hotel_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  int _currentTab = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Theme.of(context).colorScheme.secondary : const Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index ? Theme.of(context).primaryColor : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 120.0),
                child: Text(
                  'What would you like to find?',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map((e) => _buildIcon(e.key))
                    .toList(),
              ),
              const SizedBox(height: 20.0),
              const DestinationCarousel(),
              const SizedBox(height: 20.0),
              const HotelCarousel(),
            ],
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.cyan,
              ),
              label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30.0,
              ),
              label: '',
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/47c09177275483.5c82b10d5f62c.png'),
              ),
              label: '',
          ),
        ],
      ),
    );
  }
}
