import 'dart:io';

import 'package:amcart/constants/utlis.dart';
import 'package:amcart/models/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
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
    try {
      final cloudinary = CloudinaryPublic('dwqjuckio', 'mvk6zkky');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);

        Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price,
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context, e.toString());
    }
  }
}
