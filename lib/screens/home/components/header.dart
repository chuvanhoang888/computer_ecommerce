import 'package:e_commerce_shopee/constants.dart';
import 'package:e_commerce_shopee/screens/cart/cart.dart';
import 'package:e_commerce_shopee/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatefulWidget {
  final TrackingScrollController scrollController;
  const Header(this.scrollController);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color? _backgroundColor;
  Color? _backgroundColorSearch;
  Color? _colorIcon;

  Color? _backgroundColorIcon;
  Color? _color1;
  Color? _color2;
  late double _opacity;
  late double _offset;
  final _opacityMax = 0.01;
  @override
  void initState() {
    _backgroundColor = Colors.transparent;
    _backgroundColorSearch = Colors.white;
    _backgroundColorIcon = Colors.red;
    _colorIcon = Colors.white;
    _color1 = Color(0xFFF56600);
    _color2 = Color(0xFFFC1EB9);
    _opacity = 0.0;
    _offset = 0.0;
    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Image.network(
                  "https://cdn1.iconfinder.com/data/icons/business-shop-finance-symbols-set-3/91/Business_-_Shop_-_Finance_137-512.png",
                  color: _colorIcon,
                  height: 35,
                ),
              ),
              _buildInputSearch(),
              _buildIconButton(
                icon: "assets/icons/trolley.svg",
                notification: 10,
                onPressed: () =>
                    Navigator.pushNamed(context, CartScreen.routeName),
              ),
              _buildIconButton(
                icon: "assets/icons/chat.svg",
                notification: 5,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildInputSearch() {
    final sizeicon = BoxConstraints(minWidth: 40, minHeight: 40);
    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 0),
        borderRadius: const BorderRadius.all(const Radius.circular(30.0)));
    return Expanded(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 25,
            offset: const Offset(0, 5), // changes position of shadow
          )
        ]),
        child: TextField(
          onTap: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              isDense: true,
              enabledBorder: border,
              focusedBorder: border,
              hintText: "PC store",
              hintStyle: TextStyle(fontSize: 15, color: kSecondaryColor),
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 3.0, end: 3.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        // begin: Alignment.topLeft,
                        // end: Alignment(0.8,
                        //     0.0), // 10% of the width, so there are ten blinds.
                        colors: <Color>[
                          // Colors.red
                          _color1!,
                          _color2!
                        ], // red to yellow
                        tileMode: TileMode
                            .repeated, // repeats the gradient over the canvas
                      ),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: SvgPicture.asset(
                        "assets/icons/search_2.svg",
                        color: Colors.white,
                      ),
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
              prefixIconConstraints: sizeicon,
              suffixIcon: Icon(
                Icons.camera_alt_outlined,
                size: 20,
                color: kSecondaryColor,
              ),
              suffixIconConstraints: sizeicon,
              filled: true,
              fillColor: _backgroundColorSearch),
        ),
      ),
    );
  }

  _buildIconButton(
      {VoidCallback? onPressed, String? icon, int notification = 0}) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              icon!,
              color: _colorIcon,
            ),
          ),
          notification != 0
              ? Positioned(
                  top: 5,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    decoration: BoxDecoration(
                      color: _backgroundColorIcon,
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    //constraints: BoxConstraints(minWidth: 25, minHeight: 25),
                    child: Text(
                      notification.toString() + "+",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    //constraints: BoxConstraints(minHeight: 15, maxHeight: 15),
                  ),
                )
              : Text("")
        ],
      ),
    );
  }

  void _onScroll() {
    final scrollOffset = widget.scrollController.offset;
    if (scrollOffset >= _offset && scrollOffset > 5) {
      _opacity = double.parse((_opacity + _opacityMax).toStringAsFixed(2));
      if (_opacity >= 1.0) {
        _opacity = 1.0;
      }
    } else if (scrollOffset < 100) {
      _opacity = double.parse((_opacity - _opacityMax).toStringAsFixed(2));
      if (_opacity <= 1.0) {
        _opacity = 0.0;
      }
    }
    setState(() {
      if (scrollOffset <= 0) {
        _backgroundColorSearch = Colors.white;
        _colorIcon = Colors.white;
        _backgroundColorIcon = Colors.red;
        _offset = 0.0;
        _opacity = 0.0;
        _color1 = Color(0xFFF56600);
        _color2 = Color(0xFFFC1EB9);
      } else {
        _backgroundColorSearch = Colors.grey[100];
        _colorIcon = Colors.white;
        _backgroundColorIcon = Colors.black;
        _color1 = Colors.black;
        _color2 = Colors.black;
      }
      _backgroundColor = kPrimaryColor.withOpacity(_opacity);
    });
  }
}
