import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/productController.dart';
import 'package:my_store/screens/home/components/product_card.dart';

class AllProducts extends StatelessWidget {
  final productController = Get.put(
    AllProductsController(),
  );

  AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          "All Products",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: (20)),
      Obx(
        () => SizedBox(
            width: double.infinity,
            child: productController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productController.getAllProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            ProductCard(
                              product: productController.getAllProducts[index],
                            )),
                  )),
      ),
    ]));
  }
}
