import 'package:e_commerce_shopee/screens/account/setting_account/components/body.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cài đặt ứng dụng",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
