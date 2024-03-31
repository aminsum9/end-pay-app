import 'dart:convert';

import 'package:end_pay_app/widgets/button_regular.dart';
import 'package:end_pay_app/widgets/regular_header.dart';
import 'package:flutter/material.dart';
import 'package:end_pay_app/functions/host.dart' as host;
import 'package:end_pay_app/functions/handle_request.dart' as handle_request;
import 'package:end_pay_app/functions/handle_storage.dart' as handle_storage;

class UpgradePremium extends StatefulWidget {
  const UpgradePremium({super.key});

  @override
  UpgradePremiumState createState() => UpgradePremiumState();
}

class UpgradePremiumState extends State<UpgradePremium> {
  final name = TextEditingController();
  final username = TextEditingController();
  final address = TextEditingController();

  void handleUpgradePremium() async {
    var token = await handle_storage.getDataStorage('token');

    var body = {
      "name": name.text,
      "username": username.text,
      "address": address.text
    };

    handle_request
        .postData(Uri.parse('${host.BASE_URL}user/upgrade-premium'), body)
        .then((response) async {
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['success'] == true) {
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegularHeader(title: "Upgrade Premium"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Nama:'),
                  TextField(
                    controller: name,
                  ),
                  const Text('Username:'),
                  TextField(
                    controller: username,
                  ),
                  const Text('Alamat:'),
                  TextField(
                    controller: address,
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomContainer(
          handleUpgradePremium: () => handleUpgradePremium(),
        ));
  }
}

class BottomContainer extends StatefulWidget {
  @override
  BottomContainerState createState() => BottomContainerState();
  final Function() handleUpgradePremium;

  @override
  const BottomContainer({super.key, required this.handleUpgradePremium});
}

class BottomContainerState extends State<BottomContainer> {
  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Container(
      alignment: Alignment.center,
      height: height / 8,
      width: double.infinity,
      child: GestureDetector(
        onTap: () => widget.handleUpgradePremium(),
        child: ButtonRegular(
          onClick: () => widget.handleUpgradePremium(),
          title: 'Upgrade Premium',
        ),
      ),
    );
  }
}
