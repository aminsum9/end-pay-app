import 'dart:convert';

import 'package:end_pay_app/widgets/button_regular.dart';
import 'package:end_pay_app/widgets/regular_header.dart';
import 'package:flutter/material.dart';
import 'package:end_pay_app/functions/host.dart' as host;
import 'package:end_pay_app/functions/handle_request.dart' as handle_request;
import 'package:end_pay_app/functions/handle_storage.dart' as handle_storage;

class TopUpBallance extends StatefulWidget {
  const TopUpBallance({super.key});

  @override
  TopUpBallanceState createState() => TopUpBallanceState();
}

class TopUpBallanceState extends State<TopUpBallance> {
  final amount = TextEditingController();

  void handleTopUp() async {
    var body = {"amount": amount.text};

    handle_request
        .postData(
            Uri.parse('${host.BASE_URL}userballance/top-up-ballance'), body)
        .then((response) async {
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['success'] == true) {
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
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegularHeader(title: "Top Up Saldo"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Jumlah:'),
                  TextField(
                    controller: amount,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomContainer(
          handleTopUp: () => handleTopUp(),
        ));
  }
}

class BottomContainer extends StatefulWidget {
  @override
  BottomContainerState createState() => BottomContainerState();
  final Function() handleTopUp;

  @override
  const BottomContainer({super.key, required this.handleTopUp});
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
        onTap: () => widget.handleTopUp(),
        child: ButtonRegular(
          onClick: () => widget.handleTopUp(),
          title: 'Top Up',
        ),
      ),
    );
  }
}
