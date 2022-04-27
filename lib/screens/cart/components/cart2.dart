import 'package:e_commerce_shopee/components/positioned_button.dart';
import 'package:e_commerce_shopee/constants.dart';
import 'package:e_commerce_shopee/screens/cart/components/body.dart';
import 'package:e_commerce_shopee/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            bottomNavigationBar: BottomShoppingCart(),
            appBar: AppBar(
              elevation: 2,
              titleSpacing: 0, //Bỏ đi khoảng cách giữa back button và tittle
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: kPrimaryColor),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.white,
              title: Text("Giỏ hàng", style: TextStyle(color: Colors.black)),
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
            body: Body()));
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
      height: 125,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, -5),
            color: Color(0xFFDADADA).withOpacity(0.20),
            blurRadius: 5)
      ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenWidth(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(30),
                      height: getProportionateScreenHeight(30),
                      child: SvgPicture.asset(
                        "assets/icons/gift-voucher.svg",
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "E Voucher",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
              Spacer(),
              Text(
                "Chọn hoặc nhập mã",
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Colors.grey[700],
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Divider(
            height: 2,
          ),
          Row(
            children: [
              Checkbox(

                  //controlAffinity: ListTileControlAffinity.leading,
                  activeColor: kPrimaryColor,
                  value: false,
                  onChanged: (value) => setState(() => value = value!)),
              Text("Tất cả"),
              Spacer(),
              Column(
                children: [
                  Text(
                    "Tổng tiền",
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                  ),
                  Text(
                    "Nhận 0 Xu",
                    style: TextStyle(color: Color(0xFFEC870E)),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(color: kPrimaryColor),
                child: Text(
                  "Mua hàng 0",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
