import 'package:e_commerce_shopee/components/default_button.dart';
import 'package:flutter/material.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "TÊN ĐĂNG NHẬP: Chuvanhoang888",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Text(
                "Mật khẩu mới",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  //onSaved: (newValue) => password = newValue,
                  onChanged: (value) {},
                  validator: (value) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nhập mật khẩu mới",

                    //Bạn có thể thêm các biểu tượng trực tiếp vào TextFields. Bạn cũng có thể sử dụng prefixText và hậu tố cho văn bản thay thế.
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Text(
                "Xác nhận",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                width: 60,
              ),
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  //onSaved: (newValue) => password = newValue,
                  onChanged: (value) {},
                  validator: (value) {},

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nhập lại mật khẩu",

                    //Bạn có thể thêm các biểu tượng trực tiếp vào TextFields. Bạn cũng có thể sử dụng prefixText và hậu tố cho văn bản thay thế.
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 100,
          child: DefaultButton(
            text: "Lưu",
            press: () {},
          ),
        ),
        //
      ],
    );
  }
}
