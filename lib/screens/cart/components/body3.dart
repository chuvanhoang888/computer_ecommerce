import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';

List _data = [
  {
    'id': 1,
    'nameshop': 'GUMAC Official Store',
    'idShop': 'gumac',
    'image':
        'http://bizweb.dktcdn.net/thumb/grande/100/212/791/products/den-tron-e0107bd2-7e93-4407-97e6-a431963f8d04.jpg?v=1623418670430',
    'nameproduct': 'Áo thun đen',
    'price': 312000,
    'amount': 1
  },
  {
    'id': 2,
    'nameshop': 'GUMAC Official Store',
    'idShop': 'gumac',
    'image': 'https://cf.shopee.vn/file/4f36398578f7ddb74f6cb82ab838fdde',
    'nameproduct': 'Áo thun đen',
    'price': 312000,
    'amount': 1
  },
  {
    'id': 3,
    'nameshop': 'Tho Cung Store',
    'idShop': 'thocung01',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHI0GbcZJd-tm8b_t1RVN-99wvuMY7LzqA8Q&usqp=CAU',
    'nameproduct': 'Áo thun đen',
    'price': 90000,
    'amount': 2
  },
  {
    'id': 4,
    'nameshop': 'Hoang Store',
    'idShop': 'gumac',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3fvZfMOuQHP1O4sJ06DOvDulcyKENuMjNIA&usqp=CAU',
    'nameproduct': 'Bàn ghế đen',
    'price': 312000,
    'amount': 1
  },
  {
    'id': 5,
    'nameshop': 'Hoang Store',
    'idShop': 'gumac',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbrmojZKlOvxCQMx5EqGtyGRPVNiKfxqWjYQ&usqp=CAU',
    'nameproduct': 'Bàn ghếb trà',
    'price': 312000,
    'amount': 1
  },
];

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool value2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 55,
          decoration: BoxDecoration(color: Color(0xFFFDF5E6)),
          child: Row(
            children: [
              SizedBox(
                  width: 50,
                  child:
                      SvgPicture.asset("assets/icons/free-shipping-2048.svg")),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 90,
                child: Text(
                  "Nhấp vào mục Mã giảm giá ở cuối trang để được hưởng miễn phí vận chuyển bạn nhé!",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.2,
                      height: 1.4,
                      color: Colors.black),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: TabBar(
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.black,
            indicatorColor: kPrimaryColor,
            indicatorWeight: 2,
            tabs: [
              Tab(
                text: "Tất cả (216)",
              ),
              Tab(
                text: "Giảm giá",
              ),
              Tab(
                text: "Mua lần nữa",
              )
            ],
          ),
        ),
        Expanded(
          child: TabBarView(children: [
            Container(
              //height: 50,

              child: GroupedListView<dynamic, String>(
                elements: _data,
                groupBy: (item) => item['nameshop'],
                groupComparator: (group1, group2) => group2.compareTo(group1),
                //itemComparator: (item1, item2) =>
                //item1['nameshop'].compareTo(item2['nameshop']),
                // useStickyGroupSeparators: true,
                order: GroupedListOrder.ASC,
                //floatingHeader: true,

                groupSeparatorBuilder: (String groupvalue) => Container(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  margin: EdgeInsets.only(top: 7),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Checkbox(

                                //controlAffinity: ListTileControlAffinity.leading,
                                activeColor: kPrimaryColor,
                                value: value2,
                                onChanged: (value) =>
                                    setState(() => value = value!)),
                            Expanded(
                                child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 20,
                                      height: 30,
                                      child: SvgPicture.asset(
                                          "assets/icons/shopping-store.svg")),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '$groupvalue',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SvgPicture.asset(
                                      "assets/icons/arrow_right.svg")
                                ],
                              ),
                            )),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Sửa",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey[400],
                        //indent: 100,
                      )
                    ],
                  ),
                ),
                itemBuilder: (context, item) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        Checkbox(
                            //controlAffinity: ListTileControlAffinity.leading,
                            activeColor: kPrimaryColor,
                            value: value2,
                            onChanged: (value) =>
                                setState(() => value = value!)),
                        SizedBox(
                            height: 90,
                            width: 90,
                            child: Image.network(item['image'])),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['nameproduct'],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "₫" +
                                      NumberFormat.currency(
                                              locale: 'eu',
                                              decimalDigits: 0,
                                              symbol: "")
                                          .format(item['price'])
                                          .toString(),
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xFFEEEEEE))),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SvgPicture.asset(
                                            "assets/icons/remove.svg",
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                              top: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFEEEEEE)),
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFEEEEEE)))),
                                      child: Center(
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                  item['amount'].toString()))),
                                    ),
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xFFEEEEEE))),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SvgPicture.asset(
                                            "assets/icons/add.svg",
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        )
                      ],
                    ),
                  );
                },
                // separator: SizedBox(
                //   height: 5,
                // ),
              ),
            ),
            Center(
              child: Text("2"),
            ),
            Center(
              child: Text("3"),
            ),
          ]),
        )
      ],
    );
  }
}
