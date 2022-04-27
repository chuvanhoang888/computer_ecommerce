import 'package:flutter/material.dart';

class BodyEdit extends StatefulWidget {
  @override
  _BodyEditState createState() => _BodyEditState();
}

class _BodyEditState extends State<BodyEdit> {
  TextEditingController dateCtl = TextEditingController();
  bool _checkboxListTile = false;
  int _radioValue = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Color(0xFFF2F2F2),
      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Cá nhân",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: buildNameFormField()),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: buildUsernameFormField()),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: buildPhoneFormField()),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: buildEmailFormField()),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                          controller: dateCtl,
                          decoration: InputDecoration(
                            labelText: "Ngày sinh",
                            hintText: "Nhập ngày sinh",
                          ),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100)))!;

                            dateCtl.text = date.toIso8601String();
                          })),
                  buildRow(),
                ],
              )),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Đổi mật khẩu'),
                  value: _checkboxListTile,
                  onChanged: (value) {
                    setState(() {
                      _checkboxListTile = !_checkboxListTile;
                    });
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ButtonSaved(
              text: "Lưu thay đổi",
              press: () {},
            ),
          )
        ],
      ),
    ));
  }

  Row buildRow() {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                new Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'Nam',
                  style: new TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                new Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'Nữ',
                  style: new TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                new Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'Khác',
                  style: new TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            )),
      ],
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Nhập Email",
        ));
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
        decoration: InputDecoration(
      labelText: "Số điện thoại",
      hintText: "Nhập số điện thoại",
    ));
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
        decoration: InputDecoration(
      labelText: "Username",
      hintText: "Nhập username",
    ));
  }

  TextFormField buildNameFormField() {
    return TextFormField(
        decoration: InputDecoration(
      labelText: "Họ và tên",
      hintText: "Nhập họ và tên",
    ));
  }
}

class ButtonSaved extends StatelessWidget {
  const ButtonSaved({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Color(0xFFEB5757),
          side: BorderSide(width: 2, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 100)),

      //color: kPrimaryColor,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
