import 'package:e_commerce_shopee/screens/account/policy_account/components/profile_menu.dart';
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
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Container(
                      //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ProfileMenu(
                            text: "Hướng dẫn thanh toán",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            text: "Thỏa thuận sử dụng dịch vụ",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            text: "Chính sách bảo mật",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            text: "Điều khoản sử dụng",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            text: "Quy chế",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            text: "Chính sách giải quyết tranh chấp",
                            press: () {},
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE5E5E5),
                            //indent: 100,
                          ),
                          ProfileMenu(
                            text: "Đánh giá app FoodDN",
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
