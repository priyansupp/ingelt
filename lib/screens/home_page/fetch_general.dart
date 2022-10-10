import 'package:flutter/material.dart';
import 'package:ingelt/screens/home_page/vertical_groups.dart';

class FetchGeneral extends StatefulWidget {
  const FetchGeneral({Key? key}) : super(key: key);

  @override
  State<FetchGeneral> createState() => _FetchGeneralState();
}

class _FetchGeneralState extends State<FetchGeneral> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.8,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const VerGroup(date: '22nd July 2022', desc: "Ather's smart electric scooters with best-in-class settings to deal with.", category: 'Automobile', admin: 'Priyanshu Jaiswal', adminDesc: 'An aspiring app developer, and a web developer in making', onHomePage: true,);
        },
        itemCount: 5,

      ),
    );
  }
}
