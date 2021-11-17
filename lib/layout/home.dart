import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:maybelline/shared/componets/components.dart';
import 'package:maybelline/shared/controller/getx_controller/my_controller.dart';
import 'package:maybelline/shared/service/api.dart';

// using getx
class Home extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: buildAppBar(title: "MakeUp App"),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                child: defaultTextFormField(
                    controller: controller,
                    textInputType: TextInputType.text,
                    label: "Product Type",
                    hintText: "ex:lipstick",
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Enter Product Type";
                      }
                    },
                    onchange: (String value) {
                      productController.searchProduct(productType: value);
                    }),
              ),
            ),
            SizedBox(height: 20,),
            Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else if (productController.searchList.length == 0) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 3,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return makeUpCard(
                          productController.productList[index], context);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  ),
                );
              } else
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 3,
                    itemCount: productController.searchList.length,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return makeUpCard(
                          productController.searchList[index], context);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  ),
                );
            })
          ],
        ),
      ),
    );
  }
}
