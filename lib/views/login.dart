import 'dart:convert';

import 'package:end_pay_app/widgets/button_regular.dart';
import 'package:end_pay_app/widgets/regular_header.dart';
import 'package:flutter/material.dart';
import 'package:end_pay_app/functions/host.dart' as host;
import 'package:end_pay_app/functions/handle_request.dart' as handle_request;
import 'package:end_pay_app/functions/handle_storage.dart' as handle_storage;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  void handleLogin() async {
    var body = {
      "email": email.text,
      "password": password.text,
    };

    handle_request
        .postData(Uri.parse('${host.BASE_URL}user/login'), body)
        .then((response) async {
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['success'] == true) {
          await handle_storage.saveDataStorage(
              'token', jsonDecode(response.body)['data']['token'].toString());
          await handle_storage.saveDataStorage(
              'user', jsonEncode(jsonDecode(response.body)['data']));

          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, '/home');
        } else {
          //
        }
      } else {
        //
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegularHeader(title: "Masuk"),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: height / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Email:'),
                      TextField(
                        controller: email,
                      ),
                      const Text('Password:'),
                      TextField(controller: password, obscureText: true)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomContainer(
          handleLogin: () => handleLogin(),
        ));
  }
}

class BottomContainer extends StatefulWidget {
  @override
  BottomContainerState createState() => BottomContainerState();
  final Function() handleLogin;

  @override
  const BottomContainer({super.key, required this.handleLogin});
}

class BottomContainerState extends State<BottomContainer> {
  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Container(
      alignment: Alignment.center,
      height: height / 8,
      width: double.infinity,
      child: ButtonRegular(
        onClick: () => widget.handleLogin(),
        title: 'Masuk',
      ),
    );
  }
}
