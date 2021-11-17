import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maybelline/models/product_model.dart';
import 'package:maybelline/shared/constent/constent.dart';
import 'package:maybelline/shared/service/api.dart';

import 'cubit_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Product? productModel;

  // late  Map<String,dynamic> products;
  List<Product> products = [];
  List<Product> searchList = [];
  List<Product> favouriteList = [];


  fetchProductsData() {
    emit(HomeLoadingState());
    RemoteServices.fetchProducts().then((value) {
      products = value;
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  searchProduct({ required String productType}) {
    searchList=[];
    emit(SearchLoadingState());
    RemoteServices.search( productType: productType).then((value) {
      searchList=value;
      emit(SearchLoadedState());
    });
  }

  addToFavourite(Product product){
    emit(AddToFavouriteState());
    favouriteList.add(product);

  }
}
