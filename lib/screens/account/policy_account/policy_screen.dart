import 'package:e_commerce_shopee/screens/account/policy_account/components/body.dart';
import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  static String routeName = "/policy_account";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chính sách quy định",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
