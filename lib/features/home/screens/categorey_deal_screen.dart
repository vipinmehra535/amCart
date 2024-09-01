import 'package:amcart/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CategoreyDealScreen extends StatefulWidget {
  static const String routeName = '/categorey-deals';
  final String category;
  const CategoreyDealScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoreyDealScreen> createState() => _CategoreyDealScreenState();
}

class _CategoreyDealScreenState extends State<CategoreyDealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Keep shopping for ${widget.category}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
