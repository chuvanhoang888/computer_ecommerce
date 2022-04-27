import 'package:e_commerce_shopee/components/positioned_button.dart';
import 'package:e_commerce_shopee/constants.dart';
import 'package:e_commerce_shopee/screens/cart/components/body.dart';
import 'package:e_commerce_shopee/size_config.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        bottomNavigationBar: BottomShoppingCart(),
        appBar: AppBar(
          elevation: 2,
          titleSpacing: 0, //Bỏ đi khoảng cách giữa back button và tittle
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: kPrimaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: Text("Giỏ hàng của tôi (10)",
              style: TextStyle(color: Colors.black)),
          actions: [
            Center(
              child: InkWell(
                onTap: () {},
                child: Text(
                  "Sửa",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Center(
              child: PositionedButton(
                icon: "assets/icons/chat.svg",
                notification: 99,
                press: () {},
              ),
            )
          ],
        ),
        body: Body());
  }
}

class BottomShoppingCart extends StatefulWidget {
  const BottomShoppingCart({
    Key? key,
  }) : super(key: key);

  @override
  _BottomShoppingCartState createState() => _BottomShoppingCartState();
}

class _BottomShoppingCartState extends State<BottomShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5),
              color: Colors.black12,
              blurRadius: 5,
            ),
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                  side: BorderSide(
                    // ======> CHANGE THE BORDER COLOR HERE <======
                    color: Colors.black12,
                    // Give your checkbox border a custom width
                    width: 1.5,
                  ),
                  shape: CircleBorder(
                      side: BorderSide(width: 0.2, color: Color(0xFFFAFAFA))),
                  //controlAffinity: ListTileControlAffinity.leading,
                  activeColor: kPrimaryColor,
                  value: false,
                  onChanged: (value) => setState(() => value = value!)),
              Text(
                "Tất cả",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "Tổng tiền",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    "Phí vận chuyển",
                    style: TextStyle(color: Colors.black26, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(15))),
                child: Text(
                  "Mua hàng 0",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
