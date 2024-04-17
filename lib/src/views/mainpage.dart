import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/views/dashboard/homepage.dart';

import 'profiles/profiles.dart';
import 'transactions/transaction.dart';

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
    Transactions(),
    ProfilePage()
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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: GlobalVariablesType.backgroundColor,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Colors.red),
        child: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.chart_bar_alt_fill, color: Colors.blue.shade700),
              icon: Icon(CupertinoIcons.chart_bar_alt_fill, color: Colors.grey.shade400),
              // activeIcon: Image.asset('assets/icons/home-blue.png'),
              // icon: Image.asset('assets/icons/home-grey.png'),
              label: 'Markets',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.doc_chart, color: Colors.blue.shade700),
              icon: Icon(CupertinoIcons.doc_chart, color: Colors.grey.shade400),
              // activeIcon: Image.asset('assets/icons/chart-blue.png'),
              // icon: Image.asset('assets/icons/chart-grey.png'),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.rocket, color: Colors.blue.shade700),
              icon: Icon(CupertinoIcons.rocket, color: Colors.grey.shade400),
              // activeIcon: Image.asset('assets/icons/history-blue.png'),
              // icon: Image.asset('assets/icons/history-grey.png'),
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.profile_circled, color: Colors.blue.shade700),
              icon: Icon(CupertinoIcons.profile_circled, color: Colors.grey.shade400),
              label: 'Accounts',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme: const IconThemeData(color: Colors.black38),
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color:GlobalVariablesType.mainColor),
          showSelectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}