import 'package:e_commerce_shopee/screens/account/edit_account_screen.dart';
import 'package:e_commerce_shopee/screens/account/about_account/about_account_screen.dart';
import 'package:e_commerce_shopee/screens/account/favourite_account/favourite_screen.dart';
import 'package:e_commerce_shopee/screens/account/policy_account/policy_screen.dart';
import 'package:e_commerce_shopee/screens/account/voucher_account/voucher_screen.dart';
import 'package:e_commerce_shopee/screens/account/setting_account/setting_screen.dart';
import 'package:e_commerce_shopee/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 70),
          color: Color(0xFFF5F6F9),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: buildSettingIconAlign(),
                  ),
                  ProfilePic(),
                ],
              ),
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
                          icon: "assets/icons/map-pin1.svg",
                          text: "????n h??ng",
                          press: () => Navigator.pushNamed(
                              context, PolicyScreen.routeName),
                        ),
                        Divider(
                          height: 1,
                          color: Color(0xFFE5E5E5),
                          //indent: 100,
                        ),
                        ProfileMenu(
                          icon: "assets/icons/tag1.svg",
                          text: "V?? Voucher",
                          press: () => Navigator.pushNamed(
                              context, VoucherScreen.routeName),
                        ),
                        Divider(
                          height: 1,
                          color: Color(0xFFE5E5E5),
                          //indent: 100,
                        ),
                        ProfileMenu(
                          icon: "assets/icons/heart1.svg",
                          text: "Y??u th??ch",
                          press: () => Navigator.pushNamed(
                              context, FavouriteScreen.routeName),
                        ),
                        Divider(
                          height: 1,
                          color: Color(0xFFE5E5E5),
                          //indent: 100,
                        ),
                      ],
                    ),
                  ),

                  //
                ],
              ),
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
                          icon: "assets/icons/users1.svg",
                          text: "M???i b???n b??",
                          press: () {},
                        ),
                        Divider(
                          height: 1,
                          color: Color(0xFFE5E5E5),
                          //indent: 100,
                        ),
                        ProfileMenu(
                          icon: "assets/icons/help-circle1.svg",
                          text: "Trung t??m tr??? gi??p",
                          press: () {},
                        ),
                        Divider(
                          height: 1,
                          color: Color(0xFFE5E5E5),
                          //indent: 100,
                        ),
                      ],
                    ),
                  ),

                  //
                ],
              ),
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
                          icon: "assets/icons/tag1.svg",
                          text: "???ng d???ng cho ch??? qu??n",
                          press: () {},
                        ),
                      ],
                    ),
                  ),

                  //
                ],
              ),
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
                          icon: "assets/icons/help-circle1.svg",
                          text: "Ch??nh s??ch quy ?????nh",
                          press: () => Navigator.pushNamed(
                              context, PolicyScreen.routeName),
                        ),
                        Divider(
                          height: 1,
                          color: Color(0xFFE5E5E5),
                          //indent: 100,
                        ),
                        ProfileMenu(
                          icon: "assets/icons/settings1.svg",
                          text: "C??i ?????t",
                          press: () => Navigator.pushNamed(
                              context, SettingScreen.routeName),
                        ),
                        Divider(
                          height: 1,
                          color: Color(0xFFE5E5E5),
                          //indent: 100,
                        ),
                        ProfileMenu(
                          icon: "assets/icons/info1.svg",
                          text: "V??? PC STORE",
                          press: () => Navigator.pushNamed(
                              context, AboutAccountScreen.routeName),
                        ),
                      ],
                    ),
                  ),

                  //
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      backgroundColor: Colors.redAccent,
                      //side: BorderSide(width: 2, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //padding: EdgeInsets.symmetric(vertical: 15),
                      minimumSize: Size(350, 50)),
                  onPressed: () async {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove("user_email");
                    sharedPreferences.remove("user_name");
                    sharedPreferences.remove("user_image");
                    sharedPreferences.remove("user_address");
                    sharedPreferences.remove("user_phone");
                    sharedPreferences.remove("user_id");
                    Navigator.pushNamed(context, SplashScreen.routeName);
                  },
                  child: Text("????ng xu???t"))
            ],
          ),
        ),
      ),
    );
  }

  Align buildSettingIconAlign() {
    return Align(
      alignment: Alignment(1, -0.8),
      child: Container(
        //padding: EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(Icons.edit),
          highlightColor: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, EditAccountScreen.routeName);
          },
        ),
      ),
    );
  }
}
