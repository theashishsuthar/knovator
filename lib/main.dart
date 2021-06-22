import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:knovator/screens/authentication/signin.dart';

import 'constraint.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Knovator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        
      ),
      home: MyHomePage(),
    );
  }
}
