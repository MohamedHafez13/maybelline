import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maybelline/models/product_model.dart';
import 'package:maybelline/modules/product-details_screen.dart';
import 'package:maybelline/modules/product.dart';

Widget makeUpCard(Product product, context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetails("${product.productLink}")));  // web view
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => ProductTile(
      //           product: product,
      //         )));
    },
    child: Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.network(
                "${product.imageLink}",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "${product.name}",
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (product.rating != null)
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product.rating.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20,
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            SizedBox(height: 8),
            Text('\$${product.price}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    ),
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  String? hintText,
  String? label,
  FormFieldValidator<String>? validation,
  ValueChanged<String>? onchange,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: textInputType,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: hintText,
      labelText: label,
    ),
    validator: validation,
    onChanged: onchange,
  );
}

Widget defaultButton({
  required double width,
  required Color backGroundColor,
  required String label,
  required Color labelColor,
  required VoidCallback onPress,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: backGroundColor,
    ),
    child: MaterialButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: labelColor,
          ),
        ),
        onPressed: onPress),
  );
}
AppBar buildAppBar({required String title ,IconData? iconData ,VoidCallback? onPress, Color? iconColor}){
  return AppBar(
    title: Text("$title",style: TextStyle(color: Colors.teal),) ,
    leading: IconButton(
      icon: Icon(iconData,color:iconColor ,),
      onPressed: onPress,
    ),
    backgroundColor:Colors.white ,
  );
}