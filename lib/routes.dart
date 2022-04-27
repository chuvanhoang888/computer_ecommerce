import 'package:e_commerce_shopee/screens/account/account_screen.dart';
import 'package:e_commerce_shopee/screens/cart/cart.dart';
import 'package:e_commerce_shopee/screens/complete_profile/complete_profile_screen.dart';
import 'package:e_commerce_shopee/screens/home/home_page.dart';
import 'package:e_commerce_shopee/screens/search/search_list_screen.dart';
import 'package:e_commerce_shopee/screens/search/search_screen.dart';
import 'package:e_commerce_shopee/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce_shopee/screens/sign_up/sign_up_screen.dart';
import 'package:e_commerce_shopee/screens/splash/splash_screen.dart';
import 'package:e_commerce_shopee/widgets/countdown.dart';
import 'package:flutter/widgets.dart';

//Chúng ta sử dụng tên route - we use name route
//tất cả các tuyến đường của chúng tôi sẽ có sẵn ở đây - all our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SignUpscreen.routeName: (context) => SignUpscreen(),
  HomePage.routeName: (context) => HomePage(),
  CartScreen.routeName: (context) => CartScreen(),
  CountDown.routeName: (context) => CountDown(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  SearchListScreen.routeName: (context) => SearchListScreen(
        search: '',
      ),
  SplashScreen.routeName: (context) => SplashScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  //DetailPage.routeName: (context) => DetailPage(),
};
