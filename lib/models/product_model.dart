import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';


class Product extends Equatable {
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;
  final bool isBestProduct;

  Product({
     this.price = 0,
    
    required this.name,
    required this.category,
  this.quantity = 0,
    required this.description,
    required this.isBestProduct,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props{ return [name, category, description, imageUrl, isRecommended, isPopular, price, quantity, isBestProduct];
}

Product copyWith({

  String? name,
  String? category,
  String ? description,
  String? imageUrl,
  bool? isRecommended,
  bool? isPopular,
  double? price,
  int? quantity,
  bool? isBestProduct,
}){

  return Product(
    
    name:name?? this.name,
    category: category?? this.category,
    description: description?? this.description,
    imageUrl : imageUrl?? this.imageUrl,
    isRecommended: isRecommended?? this.isRecommended,
    isPopular: isPopular?? this.isPopular,
    price: price?? this.price,
    quantity: quantity?? this.quantity,
    isBestProduct: isBestProduct?? this.isBestProduct,
  
);
}
Map<String, dynamic> toMap(){
  return{
   
    'name': name,
    'category': category,
    'description': description,
    'imageUrl': imageUrl,
'isRecommended':    isRecommended,
'isBestProduct' : isBestProduct,
'price': price,
'quantity' : quantity,
'isPopular': isPopular,
  };
}


factory Product.fromSnapshot(DocumentSnapshot snap){
  return Product(
 
   name: snap['name'],
    category: snap['category'], 
    description: snap['description'], 
    isBestProduct:snap ['isBestProduct'], 
    imageUrl:snap ['imageUrl'],
     isRecommended:snap ['isRecommended'],
      isPopular: snap['isPopular'],
      price: snap['price'],
      quantity: snap['quantity'],

      
      );
}
String toJson()=> json.encode(toMap());

@override
bool get stringify => true;






static List<Product> products =[
  Product(
   
    name: 'Dog tag',
    description: 'the best dog tag in the world',
    category: 'Dog Food',
    imageUrl: 'https://images.unsplash.com/photo-1568640347023-a616a30bc3bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZG9nJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60',
    price: 200,
    quantity: 20,
    isBestProduct: true,
    isPopular: false,
    isRecommended: false,

  )
];







}
