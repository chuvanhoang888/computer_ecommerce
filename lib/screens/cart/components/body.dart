import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

List _data = [
  {
    'id': 1,
    'nameshop': 'GUMAC Official Store',
    'idShop': 'gumac',
    'image':
        'https://product.hstatic.net/1000026716/product/gearvn-prime-h410m-k-2323_b0a31f84c2fb4dff9a2b46d2049a84c4.png',
    'nameproduct': 'ASUS PRIME H410M-K',
    'price': 312000,
    'amount': 1
  },
  {
    'id': 2,
    'nameshop': 'GUMAC Official Store',
    'idShop': 'gumac',
    'image':
        'https://product.hstatic.net/1000026716/product/gearvn.com-products-8gb-ddr4-1x8g-3200-ram-pny-xlr8-gaming-1_ebc7adc549654b31927d8cb2f51b8917.jpg',
    'nameproduct': '(8GB DDR4 1x8G 3200) RAM PNY XLR8 GAMING',
    'price': 312000,
    'amount': 1
  },
  {
    'id': 3,
    'nameshop': 'Tho Cung Store',
    'idShop': 'thocung01',
    'image':
        'https://product.hstatic.net/1000026716/product/860-evo-250gb_gearvn_02.jpg',
    'nameproduct':
        'SSD Samsung 860 Evo 250GB 2.5" Sata 3 550/520 MB/s ( MZ-76E250BW )',
    'price': 90000,
    'amount': 2
  },
  {
    'id': 4,
    'nameshop': 'Hoang Store',
    'idShop': 'gumac',
    'image':
        'https://product.hstatic.net/1000026716/product/gt-710-1gd3h-1_a94b797c38ad41deb25252ab7ccef328.png',
    'nameproduct': 'MSI GeForce GT 710 1GD3H LP',
    'price': 312000,
    'amount': 1
  },
  {
    'id': 5,
    'nameshop': 'Hoang Store',
    'idShop': 'gumac',
    'image':
        'https://product.hstatic.net/1000026716/product/gearvn.com-products-case-xigmatek-venom-1_-_copy_f0deee6eda4b482eb6b779a2574bb175.jpg',
    'nameproduct': 'Case XIGMATEK VENOM',
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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Slidable(
          actionPane: SlidableBehindActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: 'More',
              color: Colors.black45,
              icon: Icons.more_horiz,
              onTap: () {},
            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {},
            )
          ],
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                        //controlAffinity: ListTileControlAffinity.leading,
                        activeColor: kPrimaryColor,
                        value: value2,
                        side: BorderSide(
                          // ======> CHANGE THE BORDER COLOR HERE <======
                          color: Colors.black12,
                          // Give your checkbox border a custom width
                          width: 1.5,
                        ),
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 0.2, color: Color(0xFFFAFAFA))),
                        onChanged: (value) => setState(() => value = value!)),
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(_data[index]['image'])),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _data[index]['nameproduct'],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  NumberFormat.currency(
                                              locale: 'eu',
                                              decimalDigits: 0,
                                              symbol: "")
                                          .format(_data[index]['price'])
                                          .toString() +
                                      "₫",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      height: 25.0,
                                      width: 25.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      // border: Border.all(
                                      //     width: 1, color: Color(0xFFEEEEEE))),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SvgPicture.asset(
                                            "assets/icons/remove (1).svg",
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
                                      ),
                                      child: Center(
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(_data[index]['amount']
                                                  .toString()))),
                                    ),
                                    Container(
                                      height: 25.0,
                                      width: 25.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SvgPicture.asset(
                                            "assets/icons/plus.svg",
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ]),
                    )
                  ],
                ),
                Divider()
              ],
            ),
          ),
        );
      },
      itemCount: _data.length,
    );
  }
}
