import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ingelt/shared/utils.dart';
import 'package:ingelt/wrapper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Ingelt App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.grey,     // primary color in whole app
        secondaryHeaderColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: const Color(0x8f00f884)),     // primarySwatch is grey, mainly the color of any widget in body(a material color) and accentColor/secondary is lightBlue, mainly other widgets color
        scaffoldBackgroundColor: Colors.white60,      // background color of scaffold everywhere
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black54),
        )
      ),
      home: const Wrapper(),
    );
  }
}