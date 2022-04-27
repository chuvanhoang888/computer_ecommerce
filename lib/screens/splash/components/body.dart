import 'dart:async';

import 'package:e_commerce_shopee/screens/home/home_page.dart';
import 'package:e_commerce_shopee/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce_shopee/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      var d = Duration(seconds: 2);
      //delayed 3 seconds to next page
      Timer(d, () {
        Navigator.pushNamed(context,
            finalEmail == null ? SignInScreen.routeName : HomePage.routeName);
      });
    });

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var email = sharedPreferences.getString('user_email');
    setState(() {
      finalEmail = email;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: getProportionateScreenWidth(250),
                child: Image.asset("assets/images/logo.png")),
            Text(
              "PC STORE",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
    // Dùng khi màn tai thỏ
  }
}
