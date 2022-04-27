import 'package:e_commerce_shopee/apiServices/api.dart';
import 'package:e_commerce_shopee/components/custom_surffix_icon.dart';
import 'package:e_commerce_shopee/components/default_button.dart';
import 'package:e_commerce_shopee/components/form_error.dart';
import 'package:e_commerce_shopee/model/login_model.dart';
import 'package:e_commerce_shopee/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce_shopee/screens/home/home_page.dart';
import 'package:e_commerce_shopee/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce_shopee/utils/ProgressHuD.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;
  bool isApiCallProcess = false;
  late APIService apiService;
  final List<String> errors = []; //errors = ["Demo Error"]

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      opacity: 0.1,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildPasswordFormField(),
            SizedBox(
              height: getProportionateScreenHeight(
                30,
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    }),
                Text("Nhớ tôi"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: Text(
                    "Quên mật khẩu",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(
                20,
              ),
            ),
            DefaultButton(
              text: "Continue",
              press: () async {
                //Navigator.pushNamed(context, AccountScreen.routeName);
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  setState(() {
                    isApiCallProcess = true;
                  });

                  apiService
                      .loginCustomer(http.Client(), email!, password!)
                      .then((model) {
                    setState(() {
                      isApiCallProcess = false;
                    });
                    if (model != null) {
                      if (remember == true) {
                        checkRemember(model);
                      }
                      Navigator.pushNamed(context, HomePage.routeName);
                    } else {
                      return showDialog(text: "Đăng nhập thất bại");
                    }
                  });
                  //Navigator.pushNamed(context, SignInScreen.routeName);

                  // if all are valid then go to success screen
                  //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future checkRemember(LoginResponseModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("user_email", model.email.toString());
    sharedPreferences.setString("user_name", model.name.toString());
    sharedPreferences.setString("user_image", model.image.toString());
    sharedPreferences.setString("user_address", model.address.toString());
    sharedPreferences.setString("user_phone", model.phone.toString());
    sharedPreferences.setString("user_id", model.id.toString());
  }

  void showDialog({String? text}) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            child: SizedBox.expand(
                child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40)),
                      child: Image.asset("assets/images/logo.png")),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text!,
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Thoát",
                              style: TextStyle(color: Colors.red),
                            )),
                        TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, SignInScreen.routeName),
                            child: Text(
                              "Đăng nhập",
                              style: TextStyle(color: kPrimaryColor),
                            ))
                      ],
                    )
                  ],
                ))
              ],
            )),
            margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          //Bạn có thể thêm các biểu tượng trực tiếp vào TextFields. Bạn cũng có thể sử dụng prefixText và hậu tố cho văn bản thay thế.
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      //Hàm onChanged() dùng để kiểm tra sự kiện chỉ cần chạm vào ô email là kiểm tra ngay ko cần button gì hết
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          //Bạn có thể thêm các biểu tượng trực tiếp vào TextFields. Bạn cũng có thể sử dụng prefixText và hậu tố cho văn bản thay thế.
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
    );
  }
}
