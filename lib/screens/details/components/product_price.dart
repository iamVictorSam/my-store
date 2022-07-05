import 'package:flutter/material.dart';
import 'package:my_store/model/product_model.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({Key? key, required this.product}) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.separated(
        itemCount: product.images.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(product.variants[0].prices[index].currencyCode.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              Text('${product.variants[0].prices[index].amount / 100}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.teal)),
            ],
          ),
        ),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10.0);
        },
      ),
    );
  }
}
