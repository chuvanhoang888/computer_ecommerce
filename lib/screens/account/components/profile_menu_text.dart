import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu2 extends StatelessWidget {
  const ProfileMenu2({
    Key? key,
    required this.text,
    required this.textdata,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text, textdata, icon;
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
            SvgPicture.asset(
              icon,
              width: 22,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Text(textdata, style: TextStyle(fontSize: 14, color: Colors.black)),
            Icon(Icons.arrow_forward_ios)
          ],
        ));
  }
}
