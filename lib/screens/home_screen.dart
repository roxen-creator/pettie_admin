
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pettie_admin/screens/product_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pettie'),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
           [
Container(
  width: double.infinity,
  height: 150,
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child:InkWell(

    onTap: (){

Get.to(()=> const ProductScreen());

    },
    child: const Card(
      child: Center(child: Text('Go To Products')),
    ),
  ),
)
          ],
        
      )),
    );
  }
}
