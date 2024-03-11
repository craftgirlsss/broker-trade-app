import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/views/dashboard/homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  // final ScrollController _homeController = ScrollController();
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 3: Settings',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariablesType.backgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/icons/home-blue.png'),
            icon: Image.asset('assets/icons/home-grey.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/icons/chart-blue.png'),
            icon: Image.asset('assets/icons/chart-grey.png'),
            label: 'Markets',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/icons/history-blue.png'),
            icon: Image.asset('assets/icons/history-grey.png'),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/icons/settings-blue.png'),
            icon: Image.asset('assets/icons/settings-grey.png'),
            label: 'Settings',
          ),
        ],
        
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: const IconThemeData(color: Colors.black38),
        unselectedLabelStyle: const TextStyle(color: Colors.black38),
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(color: CupertinoColors.activeBlue),
        showSelectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}