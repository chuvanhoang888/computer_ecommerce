import 'package:e_commerce_shopee/screens/account/setting_account/components/reset_password_form.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  static String routeName = "/password";
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Đổi mật khẩu",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(children: [
          Container(
            color: Color(0xFFF5F6F9),
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  ResetPasswordForm(),
                ],
              ),
            )),
          ),
        ]));
  }
}
