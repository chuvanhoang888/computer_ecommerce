import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_shopee/apiServices/api.dart';
import 'package:e_commerce_shopee/constants.dart';
import 'package:e_commerce_shopee/model/category_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../size_config.dart';

class CategoriesListSearch extends StatelessWidget {
  final List<CategoryMenuModel> categories;
  CategoriesListSearch({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      //height: 260,
      decoration: BoxDecoration(color: kPrimaryColor),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.7,
            crossAxisSpacing: 0.2,
            mainAxisSpacing: 0.2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: SizeConfig.screenHeight * 0.12,
                    child: Text(
                      categories[index].name,
                      style: TextStyle(fontSize: 12),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(color: Colors.white,
                        //Color(0xFFEEEEEE),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 7.0)
                        ]),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Center(
                          child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ))),
                      imageUrl: "${categories[index].image}",
                    ),
                    //Image.network(categories[index].image),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "DANH MỤC",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Spacer(),
                    _buildMoreButton(),
                  ],
                ),
              ),
              Divider(),
              BuildListCategorySearch(),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _buildMoreButton() => TextButton(
        onPressed: () {
          print("click");
        },
        style: TextButton.styleFrom(primary: Colors.transparent),
        child: Text(
          "Xem thêm >",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
}

class BuildListCategorySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCategories(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? CategoriesListSearch(
                  categories: snapshot.data as List<CategoryMenuModel>,
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
        });
  }
}
