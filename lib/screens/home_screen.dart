import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_hotel_app/screens/favorite_screen.dart';
import 'package:travel_hotel_app/screens/homepage.dart';
import 'package:travel_hotel_app/screens/profile_page.dart';
import 'package:travel_hotel_app/screens/support_center_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  final List<IconData> bottomIcons = [
    Icons.search, Icons.favorite, Icons.support, Icons.person
  ];

  final List<String> bottomLabel = [
    'Search', 'Favorite', 'Support', 'Profile'
  ];

  final List<Widget> screens = [
    const HomePage(),
    const FavoritePage(),
    SupportCenterPage(),
    ProfilePage(),
  ];

  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {
          setState(() {
            currentScreen = const HomePage();
            _currentTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: SizedBox(
          height: 60.0,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    MaterialButton(
                      minWidth:60.0,
                      onPressed: (){
                        setState(() {
                          currentScreen = const HomePage();
                          _currentTab = 0;
                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Icon(
                              Icons.search,
                              color: _currentTab == 0 ? Theme.of(context).colorScheme.secondary : Colors.grey,
                            ),
                          ),
                          Text(
                            'Search',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: _currentTab == 0 ? Theme.of(context).colorScheme.secondary : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth:60.0,
                      onPressed: (){
                        setState(() {
                          currentScreen = const FavoritePage();
                          _currentTab = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Icon(
                              Icons.favorite,
                              color: _currentTab == 1 ? Theme.of(context).colorScheme.secondary : Colors.grey,
                            ),
                          ),
                          Text(
                            'Favorite',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: _currentTab == 1 ? Theme.of(context).colorScheme.secondary : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth:60.0,
                onPressed: (){
                  setState(() {
                    currentScreen = SupportCenterPage();
                    _currentTab = 2;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Icon(
                        Icons.help,
                        color: _currentTab == 2 ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      ),
                    ),
                    Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _currentTab == 2 ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth:60.0,
                onPressed: (){
                  setState(() {
                    currentScreen = ProfilePage();
                    _currentTab = 3;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Icon(
                        Icons.person,
                        color: _currentTab == 3 ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      ),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _currentTab == 3 ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
