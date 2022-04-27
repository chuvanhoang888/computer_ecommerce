// import 'package:e_commerce_shopee/models/restaurant.dart';
// import 'package:e_commerce_shopee/screens/account/favourite_account/components/favourite_item_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: demoRestaurants.length,
//       itemBuilder: (context, index) => Dismissible(
//         key: Key(demoRestaurants[index].id.toString()),
//         direction: DismissDirection.endToStart, // TTrượt từ 1 hướng thôi
//         background: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//               color: Color(0xFFFFE6E6),
//               borderRadius: BorderRadius.circular(20)),
//           child: Row(
//             children: [Spacer(), SvgPicture.asset("assets/icons/Trash.svg")],
//           ),
//         ),
//         onDismissed: (direction) {
//           setState(() {
//             demoRestaurants.removeAt(index);
//           });
//         },
//         child: FavouriteItemCard(
//           restaurants: demoRestaurants[index],
//         ),
//       ),
//     );
//   }
// }
