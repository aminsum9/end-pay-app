import 'package:end_pay_app/widgets/button_regular.dart';
import 'package:flutter/material.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({super.key});

  @override
  WellcomeState createState() => WellcomeState();
}

class WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return PopScope(
        canPop: false,
        child: Scaffold(
          body: Container(
            height: height,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/main-logo.png',
                      height: height * 0.3,
                      width: height * 0.3,
                    ),
                    const Text('Selamat datang :)',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                ButtonRegular(
                    onClick: () => Navigator.pushNamed(context, '/login'),
                    title: 'Login'),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                ButtonRegular(
                    onClick: () => Navigator.pushNamed(context, '/register'),
                    title: 'Register')
              ],
            ),
          ),
        ));
  }
}
