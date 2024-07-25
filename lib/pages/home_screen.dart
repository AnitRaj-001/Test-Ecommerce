import 'package:flutter/material.dart';
import 'package:tst_ecommerce/models/my_product.dart';
import 'package:tst_ecommerce/pages/Details_Screen.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Products",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "All Products"),
              _buildProductCategory(index: 1, name: 'Jeans'),
              _buildProductCategory(index: 2, name: 'Shirts'),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: isSelected == 0
                ? _buildAllProducts()
                : isSelected == 1
                    ? _buildJeansProducts()
                    : _buildShirtProducts(),
          )
        ],
      ),
    );
  }

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 30,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.blue : Colors.blue.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProduct.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = MyProduct.allProducts[index];
          return GestureDetector(
            onTap:()=>Navigator.push(
              context,MaterialPageRoute(builder: (context)=> DetailsScreen(productsPage: allProducts),
            ),
            ),
              child: ProductCard(productsPage: allProducts));
        },
      );

  _buildJeansProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProduct.jeansProducts.length,
        itemBuilder: (context, index) {
          final jeansProducts = MyProduct.jeansProducts[index];
          return GestureDetector(
              onTap:()=>Navigator.push(
                context,MaterialPageRoute(builder: (context)=> DetailsScreen(productsPage: jeansProducts),
              ),
              ),
              child: ProductCard(productsPage: jeansProducts));
        },
      );

  _buildShirtProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProduct.shirtProducts.length,
        itemBuilder: (context, index) {
          final shirtProducts = MyProduct.shirtProducts[index];
          return GestureDetector(
              onTap:()=>Navigator.push(
                context,MaterialPageRoute(builder: (context)=> DetailsScreen(productsPage: shirtProducts),
              ),
              ),
              child: ProductCard(productsPage: shirtProducts));
        },
      );
}
