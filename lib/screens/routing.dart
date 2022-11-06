import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/screens/chat_page/main_page.dart';
import 'package:ingelt/screens/group_page/main_page.dart';
import 'package:ingelt/screens/home_page/home.dart';
import 'package:ingelt/screens/notifications_page/notifications.dart';
import 'package:ingelt/screens/profile_page/profile.dart';
import 'package:ingelt/shared/constants.dart';
import '../models/user_model.dart';

class BottomRouting extends StatefulWidget {
  const BottomRouting({Key? key}) : super(key: key);

  @override
  State<BottomRouting> createState() => _BottomRoutingState();
}

final UserModel userrrrr = UserModel(uid: '0', displayName: 'Priyanshu', photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in');
class _BottomRoutingState extends State<BottomRouting> {
  final user = FirebaseAuth.instance.currentUser!;

  int _selectedIndex = 4;

  final screens = [
    const Home(),
    const ChatPage(),
    const CreateGroupMainPage(),
    const Notifications(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: AppThemeData.blackishTextColor,
              ),
              activeIcon: Icon(
                Icons.home_filled,
                color: AppThemeData.blackishTextColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
                color: AppThemeData.blackishTextColor,
              ),
              activeIcon: Icon(
                Icons.chat_bubble,
                color: AppThemeData.blackishTextColor,
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.group_add_outlined,
                color: AppThemeData.blackishTextColor,
              ),
              activeIcon: Icon(
                Icons.group_add_rounded,
                color: AppThemeData.blackishTextColor,
              ),
              label: "Groups"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: AppThemeData.blackishTextColor,
              ),
              activeIcon: Icon(
                Icons.notifications_active,
                color: AppThemeData.blackishTextColor,
              ),
              label: "Notifications"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin_outlined,
                color: AppThemeData.blackishTextColor,
              ),
              activeIcon: Icon(
                Icons.person_pin_rounded,
                color: AppThemeData.blackishTextColor,
              ),
              label: "Profile"
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppThemeData.blackishTextColor,    // sets the color of underlying text when button is pressed
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppThemeData.blackishTextColor,    // color of the unselected icons
          // unselectedItemColor: Colors.red,
          selectedIconTheme: IconThemeData(
            color: AppThemeData.blackishTextColor,
          ),
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
