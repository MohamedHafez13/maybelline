import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maybelline/shared/componets/components.dart';
import 'package:maybelline/shared/controller/my_cubit/app_cubit.dart';
import 'package:maybelline/shared/controller/my_cubit/cubit_states.dart';

class TestCubit extends StatelessWidget {
  final TextEditingController productController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..fetchProductsData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var products = AppCubit.get(context).products;
          return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("MakeUp App"),
                    ),
                    backgroundColor: Colors.deepPurpleAccent,
                    elevation: 5,
                  ),
                  body: state is HomeLoadingState?Center(child: CircularProgressIndicator(),):
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            child: defaultTextFormField(
                                controller: productController,
                                textInputType: TextInputType.text,
                                label: "Product Type",
                                hintText: "ex:lipstick",
                                validation: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Enter Product Type";
                                  }
                                },
                                onchange: (String value) {
                                  AppCubit.get(context)
                                      .searchProduct(productType: value);
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppCubit.get(context).searchList.length == 0
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: StaggeredGridView.countBuilder(
                                  crossAxisCount: 3,
                                  itemCount: products.length,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 16,
                                  itemBuilder: (context, index) {
                                    return makeUpCard(products[index], context);
                                  },
                                  staggeredTileBuilder: (index) =>
                                      StaggeredTile.fit(1),
                                ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: StaggeredGridView.countBuilder(
                                  crossAxisCount: 3,
                                  itemCount:
                                      AppCubit.get(context).searchList.length,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 16,
                                  itemBuilder: (context, index) {
                                    return makeUpCard(
                                        AppCubit.get(context).searchList[index],
                                        context);
                                  },
                                  staggeredTileBuilder: (index) =>
                                      StaggeredTile.fit(1),
                                ),
                              ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
