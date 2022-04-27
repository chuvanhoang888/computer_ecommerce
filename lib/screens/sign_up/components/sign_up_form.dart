import 'package:e_commerce_shopee/apiServices/api.dart';
import 'package:e_commerce_shopee/components/custom_surffix_icon.dart';
import 'package:e_commerce_shopee/components/default_button.dart';
import 'package:e_commerce_shopee/components/form_error.dart';
import 'package:e_commerce_shopee/model/customer.dart';
import 'package:e_commerce_shopee/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce_shopee/utils/ProgressHuD.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late CustomerModel model;
  bool hidePassword = true;
  bool isApiCallProcess = false;
  String? email;
  String? password;
  String? conformPassword;
  String? name;
  String? phoneNumber;
  bool remember = false;
  late APIService apiService;
  @override
  void initState() {
    apiService = new APIService();
    model = new CustomerModel();
    super.initState();
  }

  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
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
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConformPassFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
              text: "Đăng ký",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  //print(name! + email! + phoneNumber! + conformPassword!);
                  setState(() {
                    isApiCallProcess = true;
                  });
                  // if all are valid then go to success screen
                  model = new CustomerModel(
                      name: this.name!,
                      email: this.email!,
                      phone: this.phoneNumber!,
                      password: this.conformPassword!);
                  print(model.toJson());
                  apiService.createCustomer(http.Client(), model).then((ret) {
                    setState(() {
                      isApiCallProcess = false;
                    });
                    if (ret) {
                      return showDialog(text: "Tạo tài khoản thành công");
                      // return showDialog<String>(
                      //     context: context,
                      //     builder: (BuildContext context) => AlertDialog(
                      //           title: const Text('PC Store'),
                      //           content: const Text('Tạo tài khoản thành công'),
                      //           actions: <Widget>[
                      //             TextButton(
                      //               onPressed: () =>
                      //                   Navigator.pop(context, 'Thoát'),
                      //               child: const Text('Thoát'),
                      //             ),
                      //             TextButton(
                      //               onPressed: () =>
                      //                   Navigator.pop(context, 'Đồng ý'),
                      //               child: const Text('Đồng ý'),
                      //             ),
                      //           ],
                      //         ));
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //   content: Text("Sending Message" + ret.toString()),
                      // ));

                    } else {
                      return showDialog(text: "Tài khoản đã tồn tại");
                    }
                  });
                  //Navigator.pushNamed(context, SignInScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
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

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conformPassword) {
          removeError(error: kMatchPassError);
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Nhập lại mật khẩu của bạn",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  buildFirstNameFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => name = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Tên đăng nhập",
        hintText: "Nhập tên",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/user.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      //keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Số điện thoại",
        hintText: "Nhập số điện thoại",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Nhập password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Nhập email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
