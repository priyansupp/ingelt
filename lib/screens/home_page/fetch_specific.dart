import 'package:flutter/material.dart';
import 'package:ingelt/screens/home_page/vertical_groups.dart';

class FetchSpecific extends StatefulWidget {
  const FetchSpecific({Key? key}) : super(key: key);

  @override
  State<FetchSpecific> createState() => _FetchSpecificState();
}

class _FetchSpecificState extends State<FetchSpecific> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 5.0, right: 15.0, left: 15.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.8,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const VerGroup(date: '22nd July 2022', desc: "Ather's smart electric scooters with best-in-class settings to deal with.", category: 'Automobile', admin: 'Priyanshu Jaiswal', adminDesc: 'An aspiring app developer, and a web developer in making', onHomePage: true,);
        },
        itemCount: 10,

      ),
    );
  }
}
