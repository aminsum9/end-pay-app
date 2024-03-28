import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body: SizedBox(
      child: Text('tes'),
    )));
  }
}
