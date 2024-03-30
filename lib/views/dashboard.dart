import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:end_pay_app/functions/handle_storage.dart' as handle_storage;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late dynamic dataUser;
  String userName = '';
  String accountType = '';

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    String user = await handle_storage.getDataStorage('user');

    setState(() {
      dataUser = jsonDecode(user);
      userName = jsonDecode(user)['name'];
      accountType = jsonDecode(user)['account_type'];
    });
  }

  @override
  Widget build(BuildContext context) {
    Color accTypeColor = Colors.white;
    String accTypeText = '';

    if (accountType == 'reguler') {
      accTypeColor = Colors.green;
      accTypeText = 'Reguler';
    } else if (accountType == 'premium') {
      accTypeColor = Colors.blue;
      accTypeText = 'Premium';
    } else if (accountType == 'silver') {
      accTypeColor = Colors.grey;
      accTypeText = 'Silver';
    } else if (accountType == 'gold') {
      accTypeColor = Colors.orange;
      accTypeText = 'Gold';
    }

    return PopScope(
        canPop: false,
        child: Scaffold(
          body: SafeArea(
            child: Container(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hi, $userName',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: accTypeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            accTypeText,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Saldo Rp. 0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
