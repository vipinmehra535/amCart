import 'package:amcart/constants/global_variables.dart';
import 'package:amcart/features/home/screens/categorey_deal_screen.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});
  void navigateToCategoryPage(BuildContext context, String categorey) {
    Navigator.pushNamed(
      context,
      CategoreyDealScreen.routeName,
      arguments: categorey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemExtent: 80,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(left: 5),
            child: GestureDetector(
              onTap: () => navigateToCategoryPage(
                  context, GlobalVariables.categoryImages[index]['title']!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        GlobalVariables.categoryImages[index]['image']!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Text(
                    GlobalVariables.categoryImages[index]['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
