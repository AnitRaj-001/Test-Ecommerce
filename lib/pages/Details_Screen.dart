import 'package:flutter/material.dart';
import 'package:tst_ecommerce/models/products_page.dart';
import 'package:tst_ecommerce/pages/available_size.dart';
import 'package:tst_ecommerce/pages/cart_details.dart';
import 'package:tst_ecommerce/provider/cart_provider.dart';

class DetailsScreen extends StatelessWidget {
  final ProductsPage productsPage;

  const DetailsScreen({
    super.key,
    required this.productsPage,
  });

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
              child: Image.asset(
                productsPage.image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(height: 35),
        Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 400,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productsPage.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\Rs ' '${productsPage.price}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                productsPage.discription,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Slot',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  AvailableSize(size: "28"),
                  AvailableSize(size: "30"),
                  AvailableSize(size: "32"),
                  AvailableSize(size: "34"),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Colors',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.lightBlue,
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.yellowAccent,
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs ' '${productsPage.price}',
                style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  provider.toggleProduct(productsPage);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartDetails(),
                    ),
                  );
                },
                icon: const Icon(Icons.send_sharp),
                label: const Text("Add to Cart"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
