import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteItemCard extends StatelessWidget {
  const FavouriteItemCard({
    Key? key,
    @required this.restaurants,
  }) : super(key: key);
  final restaurants;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                    image: AssetImage(restaurants.images[0]),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${restaurants.opentime} to ${restaurants.closetime}',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  restaurants.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${restaurants.address},',
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: restaurants.rating >= 4.0
                          ? Color(0xffFEC42F)
                          : Color(0xffEB5757),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Center(
                    child: Text(
                      '${restaurants.rating}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/Heart Icon_2.svg',
                    width: 25,
                    color: restaurants.isFavourite
                        ? Color(0xFFFF4848)
                        : Color(0xFFDBDEE4),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
