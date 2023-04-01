import 'package:flutter/material.dart';

import 'homepage.dart';
void main(){
  runApp(const Api());
}
class Api extends StatelessWidget {
  const Api({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Homepage(),
    );
  }
}
