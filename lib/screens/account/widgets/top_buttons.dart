import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopping/screens/account/widgets/account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your order',
              onTab: () {},
            ),
            AccountButton(
              text: 'Turn Seller',
              onTab: () {},
            ),
          ],
        ),
        const Gap(10),
        Row(
          children: [
            AccountButton(
              text: 'Log Out',
              onTab: () {},
            ),
            AccountButton(
              text: 'Your Wish List',
              onTab: () {},
            ),
          ],
        )
      ],
    );
  }
}
