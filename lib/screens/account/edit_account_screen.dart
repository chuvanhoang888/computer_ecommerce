import 'package:flutter/material.dart';

import 'components/body_edit.dart';

class EditAccountScreen extends StatelessWidget {
  static String routeName = "/edit_account";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: BodyEdit(),
    );
  }
}
