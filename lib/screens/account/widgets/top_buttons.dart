

import 'package:flutter/material.dart';
import 'package:shopping/screens/account/widgets/account_button.dart';

import '../service/account_service.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onTab: () {},
            ),
            AccountButton(
              text: 'Turn Seller',
              onTab: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Log Out',
              onTab: () => AccountServices().logOut(context),
            ),
            AccountButton(
              text: 'Your Wish List',
              onTab: () {},
            ),
          ],
        ),
      ],
    );
  }
}
