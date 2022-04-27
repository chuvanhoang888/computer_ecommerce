import 'package:e_commerce_shopee/model/checkbox_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool value = false;
  final allCartItem = CheckboxAllState(title: 'shop');
  final notifications = [
    CheckboxState(
        title: 'shop.vn',
        image:
            'http://bizweb.dktcdn.net/thumb/grande/100/212/791/products/den-tron-e0107bd2-7e93-4407-97e6-a431963f8d04.jpg?v=1623418670430',
        price: 123000,
        amount: 1),
    CheckboxState(
        title: 'av.vn',
        image: 'https://cf.shopee.vn/file/4f36398578f7ddb74f6cb82ab838fdde',
        price: 150000,
        amount: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 55,
          decoration: BoxDecoration(color: Color(0xFFFDF5E6)),
          child: Row(
            children: [
              SizedBox(
                  width: 50,
                  child:
                      SvgPicture.asset("assets/icons/free-shipping-2048.svg")),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 90,
                child: Text(
                  "Nhấp vào mục Mã giảm giá ở cuối trang để được hưởng miễn phí vận chuyển bạn nhé!",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.2,
                      height: 1.4,
                      color: Colors.black),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: TabBar(
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.black,
            indicatorColor: kPrimaryColor,
            indicatorWeight: 2,
            tabs: [
              Tab(
                text: "Tất cả (216)",
              ),
              Tab(
                text: "Giảm giá",
              ),
              Tab(
                text: "Mua lần nữa",
              )
            ],
          ),
        ),
        Expanded(
          child: TabBarView(children: [
            Container(
                //height: 50,
                decoration: BoxDecoration(color: Colors.white),
                child: ListView(children: [
                  // Column(children: [
                  //   Container(
                  //     //padding: EdgeInsets.symmetric(vertical: 2),
                  //     child: Row(
                  //       children: [
                  //         Checkbox(
                  //             //controlAffinity: ListTileControlAffinity.leading,
                  //             activeColor: kPrimaryColor,
                  //             value: checkbox.value,
                  //             onChanged: (value) =>
                  //                 setState(() => checkbox.value = value!)),
                  //         Expanded(
                  //             child: InkWell(
                  //           onTap: () {},
                  //           child: Row(
                  //             children: [
                  //               SizedBox(
                  //                   width: 20,
                  //                   child: SvgPicture.asset(
                  //                       "assets/icons/shopping-store.svg")),
                  //               SizedBox(
                  //                 width: 5,
                  //               ),
                  //               Text(
                  //                 checkbox.title,
                  //                 style: TextStyle(fontWeight: FontWeight.bold),
                  //               ),
                  //               SizedBox(
                  //                 width: 10,
                  //               ),
                  //               SvgPicture.asset("assets/icons/arrow_right.svg")
                  //             ],
                  //           ),
                  //         )),
                  //         InkWell(
                  //           onTap: () {},
                  //           child: Text(
                  //             "Sửa",
                  //             style: TextStyle(color: Colors.grey[700]),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 10,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   Divider(
                  //     height: 2,
                  //     color: Colors.grey[400],
                  //     //indent: 100,
                  //   )
                  // ]),
                  ...notifications.map(builCartItemCheckBox).toList(),
                ])),
            Center(
              child: Text("2"),
            ),
            Center(
              child: Text("3"),
            ),
          ]),
        )
      ],
    );
  }

  Widget builCartItemCheckBox(CheckboxState checkbox) => Container(
          child: Row(
        children: [
          Checkbox(
              //controlAffinity: ListTileControlAffinity.leading,
              activeColor: kPrimaryColor,
              value: checkbox.value,
              onChanged: (value) => setState(() => checkbox.value = value!)),
          SizedBox(
              height: 150,
              width: 100,
              child: Image.network(checkbox.image.toString())),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(children: [
              Text(checkbox.title),
              SizedBox(
                height: 5,
              ),
              Text("đ" + checkbox.price.toString())
            ]),
          )
        ],
      ));
}
