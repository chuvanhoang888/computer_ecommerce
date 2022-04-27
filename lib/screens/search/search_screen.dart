import 'package:e_commerce_shopee/constants.dart';
import 'package:e_commerce_shopee/screens/search/search_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_shopee/screens/search/components/body.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search_screen";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backwardsCompatibility:
              false, //Phải có cái này mới dùng được SystemUiOverlayStyle
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent),
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop()),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white, width: 1.0)),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: Colors.black,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Expanded(
                          child: TextField(
                        onSubmitted: (String value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SearchListScreen(search: value)));
                        },
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tìm kiếm...',
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding: EdgeInsets.only(left: 0, bottom: 10),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: Body());
  }
}
