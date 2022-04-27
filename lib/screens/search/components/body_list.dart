import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_shopee/apiServices/api.dart';
import 'package:e_commerce_shopee/constants.dart';
import 'package:e_commerce_shopee/model/category_menu_model.dart';
import 'package:e_commerce_shopee/model/product.dart';
import 'package:e_commerce_shopee/screens/detail/detail_page.dart';
import 'package:e_commerce_shopee/widgets/discount_painter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../size_config.dart';

class ProductListSearch extends StatelessWidget {
  final List<Product> products;
  ProductListSearch({required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          padding: EdgeInsets.all(6),
          shrinkWrap:
              true, //Hàm tạo này thích hợp cho các khung nhìn lưới có số lượng lớn (hoặc vô hạn) con vì trình tạo chỉ được gọi cho những con thực sự hiển thị, có cái này ko phải khai báo height cho gridview khi bọc nó bằng column()
          physics:
              NeverScrollableScrollPhysics(), //Tạo vật lý cuộn không cho phép người dùng cuộn(Nghiã là nó sẽ dài xuống vô hạn)
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 3, //width/height cua the ProductItemCard
            crossAxisCount: 2,
            mainAxisSpacing: 10, // khoangr cách trục đứng
            crossAxisSpacing:
                10, // Khoảng cách trục chéo (tức trục ngang nếu listview xổ từ trên xuống)
          ),
          itemBuilder: (BuildContext context, int index) {
            //var data = products[index];
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(productModel: products[index]))),
              // onTap: () => Navigator.pushNamed(context, DetailPage.routeName,
              //     arguments: {productModel:this.products[index]}),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black12),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        buildProductImage(index, constraints),
                        // Text(constraints.maxHeight.toString() +
                        //     "\n" +
                        //     constraints.maxWidth.toString() +
                        //     "\n" +
                        //     constraints.minHeight.toString() +
                        //     "\n" +
                        //     constraints.minWidth.toString()),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              buildName(index),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildPrice(index),
                                  buildSold(index),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
        false ? SizedBox(height: 150) : BottomLoader(),
      ],
    );
  }

  Stack buildProductImage(int index, BoxConstraints constraints) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6), topRight: Radius.circular(6)),
          child: CachedNetworkImage(
            placeholder: (context, url) => Center(
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ))),
            imageUrl: "${products[index].images[0].src}",
            height: constraints.maxHeight - 90,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        if (products[index].discountPercentage != 0) _buildDiscount(index),
      ],
    );
  }

  Positioned _buildDiscount(int index) => Positioned(
        right: 0,
        child: Container(
          height: 180,
          width: 38,
          child: CustomPaint(
            painter: DiscountPainter(),
            size: Size(35, 180),
            child: Column(
              children: [
                SizedBox(height: 3),
                Text(
                  "${products[index].discountPercentage}%",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  "sale",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Text buildName(int index) => Text(
        '${products[index].name}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.w500),
      );

  RichText buildPrice(int index) => RichText(
        text: TextSpan(
          text: '\đ ',
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 15,
          ),
          children: <TextSpan>[
            TextSpan(
              text:
                  // '${Format().currency(products[index].price, decimal: false)}',
                  '${NumberFormat.currency(locale: 'eu', decimalDigits: 0, symbol: "").format(products[index].price).toString()}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );

  Text buildSold(
    int index,
  ) =>
      Text(
        "Đã bán ${products[index].sold}",
        style: TextStyle(
          fontSize: 10,
        ),
      );
}

class BodyList extends StatelessWidget {
  final String search;
  BodyList({required this.search});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SẢN PHẨM LIÊN QUAN",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Divider(),
              BuildListCategorySearch(search2: search),
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

class BuildListCategorySearch extends StatefulWidget {
  final String search2;
  BuildListCategorySearch({required this.search2});
  @override
  _BuildListCategorySearchState createState() =>
      _BuildListCategorySearchState();
}

class _BuildListCategorySearchState extends State<BuildListCategorySearch> {
  late APIService apiService;
  @override
  void initState() {
    apiService = new APIService();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            apiService.getProductsSearch(http.Client(), this.widget.search2),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? ProductListSearch(
                  products: snapshot.data as List<Product>,
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
        });
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 22),
      width: double.infinity,
      alignment: Alignment.center,
      child: Center(
        child: Text(
          "Không còn sản phẩm",
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
