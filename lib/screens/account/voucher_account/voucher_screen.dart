import 'package:e_commerce_shopee/screens/account/voucher_account/components/body.dart';
import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  static String routeName = "/voucher";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ví Voucher",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
