import 'package:e_commerce_shopee/screens/account/components/profile_menu.dart';
import 'package:e_commerce_shopee/screens/account/components/profile_menu_text.dart';
import 'package:e_commerce_shopee/screens/account/setting_account/avatar_screen.dart';
import 'package:e_commerce_shopee/screens/account/setting_account/password_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xFFF5F6F9),
        ),
        SingleChildScrollView(
          child: SafeArea(
              child: Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            "THIẾT LẬP TÀI KHOẢN",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ProfileMenu(
                            icon: "assets/icons/User Icon.svg",
                            text: "Ảnh đại diện",
                            press: () => Navigator.pushNamed(
                                context, AvatarScreen.routeName),
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            icon: "assets/icons/Lock.svg",
                            text: "Mật khẩu",
                            press: () => Navigator.pushNamed(
                                context, PasswordScreen.routeName),
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            icon: "assets/icons/users1.svg",
                            text: "Thông tin liên hệ",
                            press: () {},
                          ),
                        ],
                      ),
                    ),

                    //
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            "CÀI ĐẶT ỨNG DỤNG",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ProfileMenu2(
                            icon: "assets/icons/map-pin1.svg",
                            text: "Chọn Tỉnh/Thành phố",
                            textdata: "Gia Lai",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu2(
                            icon: "assets/icons/Bill Icon.svg",
                            text: "Đổi danh mục",
                            textdata: "Ăn uống",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu2(
                            icon: "assets/icons/flag_2.svg",
                            text: "Đổi ngôn ngữ",
                            textdata: "Vietnamese - Tiếng việt",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            icon: "assets/icons/Bell.svg",
                            text: "Cài đặt thông báo",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            icon: "assets/icons/wifi.svg",
                            text: "Tiết kiệm dữ liệu di động",
                            press: () {},
                          ),
                        ],
                      ),
                    ),

                    //
                  ],
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
