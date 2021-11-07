import 'package:get/get.dart';
import 'package:maybelline/models/product_model.dart';
import 'package:maybelline/shared/service/api.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  var searchList = <Product>[].obs;

  @override
  void onInit() {
    fetchProductsData();
    super.onInit();
  }

  void fetchProductsData() {
    isLoading(true);
    try {
      RemoteServices.fetchProducts().then((value) {
        productList.value = value;
      }).catchError((error) {
        print(error.toString());
      });
    } finally {
      isLoading(false);
    }
  }

  void searchProduct({required String productType}) {
    isLoading(true);
    try {
      RemoteServices.search(productType: productType).then((value) {
        searchList.value = value;
      }).catchError((error) {
        print(error.toString());
      });
    } finally {
      isLoading(false);
    }
  }
}
