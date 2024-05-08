import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            "Deal of the day",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Gap(10),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://m.media-amazon.com/images/I/71jG+e7roXL._AC_UF1000,1000_QL80_.jpg',
              height: 235,
              fit: BoxFit.fitHeight,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                '\$999.00',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 25, top: 5, right: 40),
              child: const Text(
                'Apple MacBook Apro (13.3-inch, M1 Chip with 8 core processors)',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1663348542/Croma%20Assets/Computers%20Peripherals/Laptop/Images/245233_0_l5bk1y.png',
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                  ),
                  Image.network(
                    'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/refurb-mbp13touchbar-performance-space-gallery-2020?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1591921674000',
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                  ),
                  Image.network(
                    'https://ey6ff3dp8en.exactdn.com/wp-content/uploads/2021/01/Refurbished-MacBook-2015-A1466-5.jpg?strip=all&lossy=0&ssl=1',
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                  ),
                  Image.network(
                    'https://5.imimg.com/data5/SELLER/Default/2021/1/TX/FH/WC/7808107/12-inch-macbook-computer-laptops.jpg',
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                  ),
                  Image.network(
                    'https://idestiny.in/wp-content/uploads/2022/08/MacBook-Air-3-1.png',
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
              alignment: Alignment.topLeft,
              child: Text(
                "See all deals",
                style: TextStyle(
                  color: Colors.cyan[800],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
