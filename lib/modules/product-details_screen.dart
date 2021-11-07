import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ProductDetails extends StatelessWidget {
String url ;
ProductDetails(this.url);
  @override
  Widget build(BuildContext context) {
    return WebView(initialUrl: url,);
  }
}
