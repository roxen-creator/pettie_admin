import 'dart:convert';

import 'package:equatable/equatable.dart';


class Product extends Equatable {
  final int id;
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
    required this.id,
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
  List<Object?> get props{ return [id, name, category, description, imageUrl, isRecommended, isPopular, price, quantity, isBestProduct];
}

Product copyWith({
  int? id,
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
    id: id?? this.id,
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
    'id':id,
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


factory Product.fromMap(Map<String, dynamic>map){
  return Product(
    id:map[ 'id'],
   name: map['name'],
    category: map['category'], 
    description: map['description'], 
    isBestProduct:map ['isBestProduct'], 
    imageUrl:map ['imageUrl'],
     isRecommended:map ['isRecommended'],
      isPopular: map['isPopular'],
      price: map['price'],
      quantity: map['quantity'],

      
      );
}
String toJson()=> json.encode(toMap());
factory Product.fromJson(String source)=> Product.fromMap(json.decode(source));

@override
bool get stringify => true;






static List<Product> products =[
  Product(
    id: 1,
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
