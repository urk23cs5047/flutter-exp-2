import 'package:flutter/material.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopEase',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const ProductHomePage(),
    );
  }
}

class ProductHomePage extends StatelessWidget {
  const ProductHomePage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'Sports Shoes',
      'price': 1999,
      'rating': 4.5,
      'image': '👟',
    },
    {
      'name': 'Headphones',
      'price': 1499,
      'rating': 4.3,
      'image': '🎧',
    },
    {
      'name': 'Smartwatch',
      'price': 2999,
      'rating': 4.6,
      'image': '⌚',
    },
    {
      'name': 'Backpack',
      'price': 999,
      'rating': 4.2,
      'image': '🎒',
    },
    {
      'name': 'Sunglasses',
      'price': 799,
      'rating': 4.1,
      'image': '🕶️',
    },
    {
      'name': 'Water Bottle',
      'price': 499,
      'rating': 4.4,
      'image': '🍶',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopEase'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Colors.deepPurple.shade50,
            child: const Column(
              children: [
                Text(
                  'Smart Shopping',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Discover amazing products!',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int columns;

                if (constraints.maxWidth < 600) {
                  columns = 1;
                } else if (constraints.maxWidth < 900) {
                  columns = 2;
                } else {
                  columns = 4;
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: products.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(
                      name: product['name'],
                      price: product['price'],
                      rating: product['rating'],
                      image: product['image'],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final double rating;
  final String image;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              image,
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '₹$price',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                Text('$rating'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$name added to cart!'),
                  ),
                );
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}