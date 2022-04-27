import 'package:e_commerce_shopee/components/default_button.dart';
import 'package:e_commerce_shopee/screens/account/components/profile_pic.dart';
import 'package:flutter/material.dart';

class AvatarScreen extends StatefulWidget {
  static String routeName = "/avatar";

  @override
  _AvatarScreenState createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Đổi ảnh đại diện",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ProfilePic()],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 250,
            child: DefaultButton(
              text: "Cập nhật ảnh đại diện",
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}
