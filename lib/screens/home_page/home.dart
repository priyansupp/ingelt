import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: const Image(
                    width: 70.0,
                    height: 50.0,
                    image: AssetImage(
                        'assets/ingelt-logo.png'
                    ),
                    color: Colors.white,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: const Color(0xff00ff33),
                  child: TextField(
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      hintText: 'Search here',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:  Theme.of(context).secondaryHeaderColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.chat_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {  },
              )
            ],
            ),
          ),
        ),
      );
  }
}
