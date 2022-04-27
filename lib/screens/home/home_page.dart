import 'package:e_commerce_shopee/components/custom_bottom_nav_bar.dart';
import 'package:e_commerce_shopee/screens/home/components/content.dart';

import 'package:flutter/material.dart';
import 'package:e_commerce_shopee/screens/home/components/header.dart';

import '../../enums.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Content(_scrollController),
          Header(_scrollController),
        ],
      ),
    );
  }
}
