import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/model/product_model.dart' as model;
import 'package:my_store/screens/details/components/product_image.dart';
import 'package:my_store/screens/details/components/product_price.dart';
import 'package:my_store/screens/details/components/product_size.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  final model.Products product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Color white = const Color(0xFFFFFFFF);

  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: Get.width,
                  height: Get.height * 0.35,
                  child: Hero(
                      tag: widget.product.id,
                      child: Image.network(
                          widget.product.images[selectedImage].url,
                          fit: BoxFit.cover))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.product.images.length,
                    (index) => productReview(index)),
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(widget.product.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24))),
              ProductPrice(product: widget.product),
              const SizedBox(height: 10.0),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Product Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18))),
              const SizedBox(height: 10.0),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(widget.product.description,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.grey))),
              const SizedBox(height: 10.0),
              ProductSize(product: widget.product),
            ],
          ),
        ));
  }

  GestureDetector productReview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() => selectedImage = index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15, top: 15),
        padding: const EdgeInsets.all(3),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: selectedImage == index
                ? const Color(0xFFE7B944)
                : Colors.transparent,
          ),
        ),
        child:
            Image.network(widget.product.images[index].url, fit: BoxFit.cover),
      ),
    );
  }
}
