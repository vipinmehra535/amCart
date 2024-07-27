import 'package:amcart/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopBottoms extends StatefulWidget {
  const TopBottoms({super.key});

  @override
  State<TopBottoms> createState() => _TopBottomsState();
}

class _TopBottomsState extends State<TopBottoms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AccountButton(
              onTap: () {},
              text: "Your Orders",
            ),
            AccountButton(
              onTap: () {},
              text: "Turn Seller",
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AccountButton(
              onTap: () {},
              text: "Logout",
            ),
            AccountButton(
              onTap: () {},
              text: "Your Wishlist",
            ),
          ],
        ),
      ],
    );
  }
}
