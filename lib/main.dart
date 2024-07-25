import 'package:flutter/material.dart';
import 'package:tst_ecommerce/pages/cart_details.dart';
import 'package:tst_ecommerce/provider/cart_provider.dart';
import 'package:tst_ecommerce/provider/favorite_provider.dart';
import 'package:tst_ecommerce/pages/favorite_screen.dart';
import 'package:tst_ecommerce/pages/home_screen.dart';
import 'package:tst_ecommerce/pages/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MaterialApp(
          title: 'SHOP - WAY',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorSchemeSeed: Colors.blue,
              scaffoldBackgroundColor: Colors.grey.shade100),
          home: const MyHomePage(
            title: 'Shop - Way',
          ),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List Screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartDetails(),
                    ),
                  ),
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() => currentIndex = value);
        },
        selectedItemColor: Colors.blue.shade300,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

