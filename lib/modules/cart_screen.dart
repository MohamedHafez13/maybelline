// import 'package:flutter/material.dart';
// import 'package:maybelline/models/product_model.dart';
// import 'package:maybelline/shared/componets/components.dart';
// class Cart extends StatelessWidget {
// final Product product;
// Cart(this.product);
// Widget productCart(context , ){
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Row(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width/2.5,
//           child: Image.network("${product.imageLink}",fit: BoxFit.cover,),
//         ),
//         Column(
//           children: [
//             Text( "Price : \$${product.price}",),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(title: "Cart "),
//       body: productCart(context),
//       // ListView.builder(
//       //   itemCount: 5,
//       //     itemBuilder:(context ,index)=>
//       //         productCart(context),
//       // ),
//     );
//   }
// }
