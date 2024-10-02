import 'package:flutter/material.dart';
import 'package:tugasdua/presentation/product/product_detail_page.dart';
import 'package:tugasdua/presentation/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/satu.jpg',
      'name': 'Product 1',
      'price': 200000,
    },
    {
      'image': 'assets/images/dua.jpg',
      'name': 'Product 2',
      'price': 300000,
    },
    {
      'image': 'assets/images/tiga.jpg',
      'name': 'Product 3',
      'price': 250000,
    },
    {
      'image': 'assets/images/empat.jpg',
      'name': 'Product 4',
      'price': 300000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Men Clothes"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: widget.username),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                promoPoster('assets/images/satu.jpg'),
                promoPoster('assets/images/dua.jpg'),
                promoPoster('assets/images/tiga.jpg'),
                promoPoster('assets/images/empat.jpg'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Hai ${widget.username}\nSelamat Datang",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
          ),

          // Section for product grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                // Passing data ke productCard
                return productCard(
                  context,
                  products[index]['image']!,
                  products[index]['name']!,
                  products[index]['price']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget promoPoster(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: 225,
      ),
    );
  }

  Widget productCard(BuildContext context, String imagePath, String productName,
      double productPrice) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigate ke detail produk
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      imagePath: imagePath,
                      productName: productName,
                      productPrice: productPrice,
                    ),
                  ),
                );
              },
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            productName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '\Rp$productPrice',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    imagePath: imagePath,
                    productName: productName,
                    productPrice: productPrice,
                  ),
                ),
              );
            },
            child: const Text('Beli'),
          ),
        ],
      ),
    );
  }
}
