import 'package:e_commerce_shopee/constants.dart';
import 'package:e_commerce_shopee/screens/search/components/body_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchListScreen extends StatefulWidget {
  static String routeName = "/search_list_screen";
  final String search;
  const SearchListScreen({Key? key, required this.search}) : super(key: key);

  @override
  _SearchListScreenState createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String searchValue;
  @override
  void initState() {
    setState(() {
      searchValue = this.widget.search;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                          setState(() {
                            searchValue = value;
                          });
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
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "assets/icons/filter.svg",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Lọc",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: BodyList(search: searchValue));
  }
}
