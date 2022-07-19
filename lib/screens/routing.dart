import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/screens/create_group_page/create_group.dart';
import 'package:ingelt/screens/home_page/home.dart';
import 'package:ingelt/screens/notifications_page/notifications.dart';
import 'package:ingelt/screens/profile_page/profile.dart';

class BottomRouting extends StatefulWidget {
  const BottomRouting({Key? key}) : super(key: key);

  @override
  State<BottomRouting> createState() => _BottomRoutingState();
}

class _BottomRoutingState extends State<BottomRouting> {
  final user = FirebaseAuth.instance.currentUser!;


  int _selectedIndex = 0;

  final screens = [
    const Home(),
    const CreateGroup(),
    const Notifications(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0 ? Icon(
                Icons.home_filled,
                color: Theme.of(context).secondaryHeaderColor,
              ) : Icon(
                Icons.home_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1 ? Icon(
                Icons.group_add_rounded,
                color: Theme.of(context).secondaryHeaderColor,
              ) : Icon(
                Icons.group_add_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: "Create Group"
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2 ? Icon(
                Icons.notifications_active,
                color: Theme.of(context).secondaryHeaderColor,
              ) : Icon(
                Icons.notifications_active_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: "Notifications"
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 3 ? Icon(
                Icons.person_pin_rounded,
                color: Theme.of(context).secondaryHeaderColor,
              ) : Icon(
                Icons.person_pin_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: "Profile"
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).secondaryHeaderColor,    // sets the color of underlying text when button is pressed
          onTap: _onItemTapped,
        ),
        ),
      );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  
}
