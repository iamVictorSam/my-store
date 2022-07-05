import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/model/product_model.dart' as model;
import 'package:my_store/screens/details/product_details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final model.Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 140,
        child: GestureDetector(
          		//Todo: Route to Product Details Screen
            onTap: () => Get.to(() => ProductDetails(product: product)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: product.id.toString(),
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(product.thumbnail),
                                fit: BoxFit.cover))),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      product.title,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      maxLines: 2,
                    )),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("\$${product.variants[0].prices[1].amount / 100}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal,
                        ))),
                const SizedBox(height: 10),
              ],
            )));
  }
}
