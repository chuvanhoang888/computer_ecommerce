import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Text(
                  "Phiên bản 1.0.0",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Spacer(),
                Image(
                  image: AssetImage("assets/images/bct.png"),
                  width: 160,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "FoodDV.vn là gì?",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Text(
                  "Được xây dựng từ giữa năm 2012 tại TP. HCM, Việt Nam, FoodDN là cộng đồng tin cậy cho mọi người có thể tìm kiếm, đánh giá, bình luận các địa điểm ăn uống: nhà hàng, quán ăn, cafe, bar, karaoke, tiệm bánh, khu du lịch... tại Việt Nam - từ website hoặc ứng dụng di động. Tất cả thành viên từ Bắc đến Nam, FoodDN kết nối những thực khách đến với các địa điểm ăn uống lớn nhỏ cả đất nước.",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Đến thời điểm hiện tại, Foody với hàng chục ngàn địa điểm và hàng ngàn bình luận, hình ảnh tại Việt Nam, ở hầu hết các tỉnh thành. Foody là cách dễ nhất để bạn có thể tìm kiếm và lựa chọn địa điểm tốt nhất cho mình và bạn bè.",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Tìm kiếm dễ dàng",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "Công cụ tìm kiếm thông minh bằng cách gõ: tên địa điểm, hoặc địa chỉ, hoặc tên đường, hoặc tên món ăn, hoặc mục đích, hoặc tên khu vực. Hệ thống tìm kiếm sử dụng gợi ý & xem nhanh thông tin, giúp bạn tìm địa điểm nhanh nhất",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Phân loại rõ ràng",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "FoodDN phân loại các địa điểm ra rất chi tiết: theo mục đích, loại hình, món ăn, giá cả, loại ẩm thực... Điều này giúp cộng đồng lọc địa điểm theo mục đích của mình rất nhanh chóng.",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Bình luận & Đánh giá",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "FoodDN cho phép thành viên chèn hình ảnh vào bình luận, đánh giá địa điểm với 5 tiêu chí: Món ăn, Vị trí, Không gian, Giá cả và Dịch vụ, điều này giúp cộng đồng có cái nhìn tổng quan về các tiêu chí của mỗi địa điểm. Do đặc thù của mỗi địa điểm khác nhau, ví dụ Quán cafe, cộng đồng sẽ quan tâm đến Không gian, đối với Quán Ăn thì cộng đồng quan tâm đến chất lượng món... Đây chính là điểm khác biệt của FoodDN so với cách dịch vụ khác.",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
