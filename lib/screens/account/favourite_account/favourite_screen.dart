import 'package:e_commerce_shopee/screens/account/components/body.dart';
import 'package:e_commerce_shopee/screens/account/favourite_account/components/body.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/favourite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yêu thích",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
