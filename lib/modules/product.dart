// import 'package:flutter/material.dart';
// import 'package:maybelline/models/product_model.dart';
// import 'package:maybelline/modules/cart_screen.dart';
// import 'package:maybelline/shared/componets/components.dart';
//
// class ProductTile extends StatelessWidget {
//   final Product product;
//
//   const ProductTile({Key? key, required this.product}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(
//         title: "${product.name}",
//         iconData: Icons.arrow_back,
//         iconColor: Colors.tealAccent,
//         onPress: (){
//           Navigator.of(context).pop();
//         },
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 2,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Image.network(
//                 '${product.imageLink}',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Price : \$${product.price}",
//               style: TextStyle(fontSize: 20, color: Colors.teal),
//             ),
//             Spacer(),
//             defaultButton(
//                 backGroundColor: Colors.teal,
//                 label: "Add To Cart ",
//                 labelColor: Colors.white,
//                 width: double.infinity,
//                 onPress: () {
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart(product)));
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
