import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:end_pay_app/functions/host.dart' as host;
import 'package:end_pay_app/functions/handle_storage.dart' as handle_storage;
import 'package:end_pay_app/functions/handle_request.dart' as handle_request;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    checkLogin();
  }

  void checkLogin() async {
    var token = await handle_storage.getDataStorage('token');

    if (token.toString() != "") {
      handle_request
          .postData(Uri.parse('${host.BASE_URL}user/check-login'), {}).then(
              (response) async {
        if (response.statusCode == 200) {
          if (jsonDecode(response.body)['success'] == true) {
            await handle_storage.saveDataStorage(
                'token', jsonDecode(response.body)['data']['token'].toString());
            await handle_storage.saveDataStorage(
                'user', jsonEncode(jsonDecode(response.body)['data']));

            Navigator.pushNamed(context, '/home');
          }
        } else {
          Navigator.pushNamed(context, '/wellcome');
        }
      });
    } else {
      Navigator.pushNamed(context, '/wellcome');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/main-logo.png",
          width: 180,
          height: 180,
        ),
      ),
    );
  }
}
