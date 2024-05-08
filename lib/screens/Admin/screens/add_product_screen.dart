import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopping/common/utls/error_utils.dart';
import 'package:shopping/common/widget/custom_button.dart';
import 'package:shopping/common/widget/custom_textFiled.dart';
import 'package:shopping/screens/Admin/services/admin_services.dart';

import '../../../constant/globle_variable.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product-name';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productnamecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  String category = 'Mobiles';
  List<File> images = [];
  final _addproductformKey = GlobalKey<FormState>();

  @override
  void dispose() {
    productnamecontroller.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  List<String> productName = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  void sellProduct() {
    if (_addproductformKey.currentState!.validate() && images.isNotEmpty) {}
    adminServices.sellProduct(
      context: context,
      name: productnamecontroller.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      quantity: double.parse(quantityController.text),
      category: category,
      images: images,
    );
  }

  void selectImage() async {
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
          centerTitle: true,
          title: const Text(
            'Add Product',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addproductformKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Gap(20),
                images.isNotEmpty
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
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          autoPlay: true,
                          viewportFraction: 1,
                          height: 200,
                          disableCenter: true,
                        ))
                    : GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_copy_outlined,
                                  size: 40,
                                ),
                                Text(
                                  'Select Product Image',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const Gap(30),
                CustomtextField(
                    controller: productnamecontroller, text: 'Product Name'),
                const Gap(10),
                CustomtextField(
                    maxline: 7,
                    controller: descriptionController,
                    text: 'Description'),
                const Gap(10),
                CustomtextField(controller: priceController, text: 'Price '),
                const Gap(10),
                CustomtextField(
                    controller: quantityController, text: 'Quantity'),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productName.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        category = val!;
                      });
                    },
                  ),
                ),
                const Gap(20),
                CustomButton(
                  text: 'Sell',
                  onTab: sellProduct,
                ),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
