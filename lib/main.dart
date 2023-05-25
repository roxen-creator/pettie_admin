
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pettie_admin/screens/home_screen.dart';
import 'package:pettie_admin/screens/product_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pettie Admin ',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
     
      home: const HomeScreen(),
    getPages: [

     GetPage (name: '/products', page:()=>const ProductScreen())
    ],
    
    
    );
  }
}
