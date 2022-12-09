import 'package:countdown_app/countdown/view/button_add_new_countdown.dart';
import 'package:countdown_app/countdown/view/list_countdowns.dart';
import 'package:countdown_app/store/view/store_screen.dart';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdowns'),
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: const [
          CountdownList(),
          StoreScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Countdowns'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
        ],
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
      floatingActionButton: const ButtonAddNewCountdown(),
    );
  }
}
