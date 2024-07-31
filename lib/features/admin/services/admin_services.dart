import 'dart:io';

import 'package:amcart/constants/utlis.dart';
import 'package:flutter/material.dart';

class AdminServices {
  void sellProducts({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    try {} catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
