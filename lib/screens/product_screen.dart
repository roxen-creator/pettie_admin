
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pettie_admin/controllers/product_controller.dart';
import 'package:pettie_admin/models/product_model.dart';
import 'package:pettie_admin/screens/new_product_screen.dart';

class ProductScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
 ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

 SizedBox(
  height: 100,
  child: Card(
    margin: EdgeInsets.zero,
    color: Colors.black,
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            Get.to(() =>  NewProductScreen());
          },
          icon: const Icon(Icons.add_circle, color: Colors.white,),
        ),
        const Text(' Add a New Product',
        style: TextStyle(
          fontSize: 16, 
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        
        )
      ],
    ),
  ),
),

const SizedBox(height: 10,),


            Expanded(
              child: ListView.builder(
                  itemCount:productController.products.length,
                  itemBuilder: (context, index) {
                    return Obx(()=>
                       SizedBox(
                        height: 210,
                        child: ProductCard(product: productController.products[index],index: index,),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
   ProductCard({super.key, required this.product, required this.index});

final ProductController productController = Get.find();
final int index;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
          
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                // const SizedBox(width: 10),
                Expanded(
                  child: Column(
                 
                    children: [
                      Row(
                      
                        children: [
                        
                          const SizedBox(
                            width: 50,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                            // const SizedBox(width: 10,),
                          Slider(
                            value: product.price,
                            min: 0,
                            max: 10000,
                            divisions: 50,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black26,
                            onChanged: (value) {
                              productController.updateProductPrice(index, product, value);

                            
                            },
                          ),
                           Text(
                            'Rs.${product.price.toStringAsFixed(1)}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          
                        ],
                      ),
                       Row(
                        children: [
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 50,
                            child: const Text(
                              'Qty.',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // const SizedBox(width:,),
                          Slider(
                            value: product.quantity.toDouble(),
                            min: 0,
                            max: 10000,
                            divisions: 50,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black26,
                            onChanged: (value) {
                              productController.updateProductQuantity(index, product, value.toInt());
                            },
                          ),
                           Text(
                            '${product.quantity.toInt()}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
