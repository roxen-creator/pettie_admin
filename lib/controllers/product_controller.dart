import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductController extends GetxController{
  List<Product> products = Product.products.obs;

  var newProduct = {}.obs;
get price => newProduct['price'];
get quantity=> newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];
   get isBestProduct => newProduct['isBestProduct'];


  void updateProductPrice(
    int index,
    Product product, double value,

  ){
    product.price= value;
    products[index]= product;
    

  }
void updateProductQuantity(

  int index,
  Product product,
  int value,
  
){
  product.quantity= value;
  products[index] = product;
}



}