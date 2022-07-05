// import 'package:flutter/material.dart';
// import 'package:my_store/model/product_model.dart' as model;

// class ProductImage extends StatelessWidget {
//   const ProductImage({Key? key, required this.product, this.press, this.index})
//       : super(key: key);

//   final model.Products product;
//   final Function()? press;
//   final int? index;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Container(
//         margin: const EdgeInsets.only(right: 15, top: 15),
//         padding: const EdgeInsets.all(3),
//         width: 70,
//         height: 70,
//         decoration: BoxDecoration(
//           color: white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: selectedImage == index
//                 ? const Color(0xFFE7B944)
//                 : Colors.transparent,
//           ),
//         ),
//         child: Image.network(product.images[index!].url, fit: BoxFit.cover),
//       ),
//     );
//   }
// }
