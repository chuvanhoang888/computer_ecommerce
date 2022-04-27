import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
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
        centerTitle: true,
        title: Text("Đăng nhập"),
      ),
      body: Body(),
    );
  }
}
