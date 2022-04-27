import 'package:e_commerce_shopee/screens/account/about_account/components/body.dart';
import 'package:flutter/material.dart';

class AboutAccountScreen extends StatelessWidget {
  static String routeName = "/about_account";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Về FoodDN",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
