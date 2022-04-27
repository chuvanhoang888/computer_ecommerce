import 'package:flutter/material.dart';
import 'package:e_commerce_shopee/components/custom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = "/account";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.account,
      ),
    );
  }
}
