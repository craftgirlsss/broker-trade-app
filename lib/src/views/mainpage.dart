import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // enableFeedback: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Markets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black38,
        unselectedIconTheme: const IconThemeData(
          color: Colors.black38
        ),
        unselectedLabelStyle: const TextStyle(color: Colors.black38),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: GlobalVariablesType.buttonTextColor![3],
        onTap: (int index) {
              switch (index) {
            case 0:
              // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
            case 1:
              Text("Hello");
            case 2:
              Text("");
            case 3:
              Text("");
                
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}