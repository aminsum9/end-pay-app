import 'package:flutter/material.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({super.key});

  @override
  WellcomeState createState() => WellcomeState();
}

class WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Text('tes'),
        ));
  }
}
