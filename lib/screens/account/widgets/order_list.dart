import 'package:flutter/material.dart';
import 'package:shopping/constant/globle_variable.dart';
import 'package:shopping/screens/account/widgets/product.dart';

class Oders extends StatefulWidget {
  const Oders({super.key});

  @override
  State<Oders> createState() => _OdersState();
}

class _OdersState extends State<Oders> {
  //temporyList

  List list = [
    'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://supertails.com/cdn/shop/files/111_1_3f51aa15-4e01-46bb-b1b1-efd0b8827635.jpg?v=1701496334',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Order",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "See all",
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
          ],
        ),
        //display order
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            right: 0,
            top: 20,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SingleProduct(
                imgUrl: list[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
