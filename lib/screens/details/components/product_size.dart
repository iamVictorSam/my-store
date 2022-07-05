import 'package:flutter/material.dart';
import 'package:my_store/model/product_model.dart';

class ProductSize extends StatelessWidget {
  ProductSize({Key? key, required this.product}) : super(key: key);

  final Products product;

  Color secondary = const Color(0xFFE7B944);
  Color textLightColor = const Color(0xFF605A65);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Text('Sizes Available',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(width: 20),
            ...List.generate(
                product.variants.length,
                (index) => Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Center(
                        child: Text(
                      product.variants[index].title,
                      style: TextStyle(color: textLightColor),
                    )))),
          ],
        ),
      ),
    );
  }
}
