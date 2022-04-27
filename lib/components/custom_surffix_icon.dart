import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    @required this.svgIcon,
  }) : super(key: key);
  final String? svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          //lỖi do thuộc tính const không thay đổi nên phải bỏ nó đi
          0,
          20,
          20,
          20),
      child: SvgPicture.asset(
        svgIcon!,
        height: 18,
      ),
    );
  }
}
