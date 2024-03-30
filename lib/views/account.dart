import 'package:end_pay_app/widgets/button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:end_pay_app/styles/colors.dart' as colors;

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          body: SafeArea(
              child: Container(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: colors.primary,
                  height: 100,
                ),
                ButtonList(onClick: () => {}, title: 'Keluar')
              ],
            ),
          )),
        ));
  }
}
