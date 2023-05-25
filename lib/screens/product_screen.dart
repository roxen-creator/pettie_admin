import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pettie_admin/models/product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
            Expanded(
              child: ListView.builder(
                  itemCount: Product.products.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 210,
                      child: ProductCard(product: Product.products[index]),
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
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
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
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Slider(
                            value: product.price,
                            min: 0,
                            max: 10000,
                            divisions: 50,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black26,
                            onChanged: (value) {},
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
                          Slider(
                            value: product.quantity.toDouble(),
                            min: 0,
                            max: 10000,
                            divisions: 50,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black26,
                            onChanged: (value) {},
                          ),
                           Text(
                            'Rs.${product.quantity.toInt()}',
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
