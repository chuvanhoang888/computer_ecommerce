import 'package:e_commerce_shopee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/body.dart';

class SignUpscreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        backwardsCompatibility:
            false, //Phải có cái này mới dùng được SystemUiOverlayStyle
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent),
        backgroundColor: kPrimaryColor2,
        title: Text(
          "Đăng ký",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
