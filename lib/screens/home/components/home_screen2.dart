////////
import 'package:e_commerce_shopee/components/positioned_button.dart';
import 'package:e_commerce_shopee/screens/home/components/banner_slider.dart';
import 'package:e_commerce_shopee/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_shopee/screens/home/components/header.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../../constants.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = TrackingScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: _buildInputSearch(),
        actions: [
          PositionedButton(
            icon: "assets/icons/trolley.svg",
            notification: 10,
            press: () {},
          ),
          PositionedButton(
            icon: "assets/icons/chat.svg",
            notification: 5,
            press: () {},
          ),
        ],
      ),
      body: Body(),
    );
  }

  _buildInputSearch() {
    final sizeicon = BoxConstraints(minWidth: 25, minHeight: 25);
    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 0),
        borderRadius: const BorderRadius.all(const Radius.circular(4.0)));
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                isDense: true,
                enabledBorder: border,
                focusedBorder: border,
                hintText: "E-Commerce Shop",
                hintStyle: TextStyle(fontSize: 18, color: kPrimaryColor),
                prefixIcon: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
                  child: SvgPicture.asset(
                    "assets/icons/loupe.svg",
                    width: 25,
                  ), // myIcon is a 48px-wide widget.
                ),
                prefixIconConstraints: sizeicon,
                // suffixIcon: Icon(Icons.camera_alt),
                // suffixIconConstraints: sizeicon,
                filled: true,
                fillColor: Colors.white),
          ),
        ),
      ],
    );
  }
}
