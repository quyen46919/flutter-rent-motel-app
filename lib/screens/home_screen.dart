import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_hotel_app/widgets/category_list.dart';
import 'package:travel_hotel_app/widgets/mansory_grid.dart';

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
    FontAwesomeIcons.hotel,
    FontAwesomeIcons.bus,
    FontAwesomeIcons.biking,
  ];

  final List<String> _places = ['Flight', 'Hotel', 'Bus', 'Bike'];

  final List<Color> _colors = [
    const Color(0xff8168dd),
    const Color(0xffF67063),
    const Color(0xff4DCCFF),
    const Color(0xffFE9055),
  ];

  final List<IconData> bottomIcons = [
    Icons.search, Icons.favorite, Icons.notifications, Icons.person
  ];

  final List<String> bottomLabel = [
    'Search', 'Favorite', 'Notification', 'Profile'
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: _colors[index],
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: _selectedIndex == index ?
              [
                BoxShadow(
                  color: _colors[index].withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 12,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ] : [],
            ),
            child: Icon(
              _icons[index],
              size: 25.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
                _places[index],
              style: TextStyle(
                color: _colors[index],
                fontWeight: FontWeight.bold,
                fontSize: 17.0
              ),
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                        'Hi, Nguyen Chau Quyen!',
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: const Icon(
                          FontAwesomeIcons.bell,
                        size: 20.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                            spreadRadius: 12,
                            blurRadius: 12,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ]
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 140.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Let\'s start',
                      style: TextStyle(
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'your vacations!',
                      style: TextStyle(
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Container(
                            width: double.infinity,
                            child: const Material(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'Search for places...',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            height: 50,
                            // width: ,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        child: const Icon(
                          FontAwesomeIcons.stream,
                          size: 20.0,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xff342861),
                        ),
                      )
                    ],
                  ),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map((e) => _buildIcon(e.key))
                    .toList(),
              ),
              // const SizedBox(height: 30.0),
              // const DestinationCarousel(),
              const SizedBox(height: 20.0),
              const CategoryList(),
              const SizedBox(height: 20.0),
              const MasonryGrid(),
              // const SizedBox(height: 20.0),
              // const HotelCarousel(),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: bottomIcons.map((icon) {
              var index = bottomIcons.indexOf(icon);
              return MaterialButton(
                minWidth:60.0,
                onPressed: (){
                  setState(() {
                    _currentTab = index;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Icon(
                        icon,
                        color: _currentTab == index ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      ),
                    ),
                    Text(
                      bottomLabel[index],
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _currentTab == index ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
