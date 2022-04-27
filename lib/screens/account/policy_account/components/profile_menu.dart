import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          //side: BorderSide(color: Color(0xFFE5E5E5), width: 1.0),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        //padding: EdgeInsets.all(15),
        //shape: Border(bottom: BorderSide(color: Color(0xFFE5E5E5), width: 1.0)),
        onPressed: press,
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ));
  }
}
