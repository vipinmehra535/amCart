import 'dart:io';

import 'package:amcart/common/widgets/custom_button.dart';
import 'package:amcart/common/widgets/custom_textfield.dart';
import 'package:amcart/constants/global_variables.dart';
import 'package:amcart/constants/utlis.dart';
import 'package:amcart/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityNameController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  final _addProductFormKey = GlobalKey<FormState>();

  String category = 'Mobiles';

  List<File> images = [];

  void sellProducts() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProducts(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityNameController.text),
        category: category,
        images: images,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityNameController.dispose();
  }

  List<String> productCatergories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

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
          title: const Text(
            'Add Product',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                images.isNotEmpty
                    ? images.length > 1
                        ? CarouselSlider(
                            items: images.map((i) {
                              return Builder(
                                builder: (BuildContext context) => Image.file(
                                  i,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 200,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 4),
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 1),
                              autoPlayCurve: Curves.easeOutBack,
                            ),
                          )
                        : Image.file(
                            images[0],
                            fit: BoxFit.cover,
                            height: 200,
                          )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Upload Product Image',
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                CustomTextfield(
                  controller: productNameController,
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: priceController,
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: quantityNameController,
                  hintText: 'Quantity',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCatergories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        category = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: 'Sell',
                  onTap: sellProducts,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
