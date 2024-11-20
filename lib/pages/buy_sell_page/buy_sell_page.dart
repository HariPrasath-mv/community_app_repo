import 'package:flutter/material.dart';
import 'add_item_page.dart'; // Import the Add Item Page.
import 'item_details_page.dart'; // Import the Item Details Page.

class BuySellPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Properties', 'icon': Icons.home},
    {'name': 'Electronics', 'icon': Icons.tv},
    {'name': 'Furniture', 'icon': Icons.chair},
    {'name': 'Vehicles', 'icon': Icons.directions_car},
  ];

  final List<Map<String, dynamic>> listings = [
    {
      'title': 'Sony OLED Smart TV - 55 inch',
      'price': '₹6000',
      'status': 'SALE',
      'location': 'Sharlow Apartments, Bangalore',
      'image': 'assets/images/discover/sony_tv.png',
    },
    {
      'title': '7" Medical Mattress',
      'price': '₹2000',
      'status': 'SALE',
      'location': 'Sharlow Apartments, Bangalore',
      'image': 'assets/images/discover/mattress.png',
    },
    {
      'title': 'Comic Books',
      'price': 'Free',
      'status': 'FREE',
      'location': 'Sharlow Apartments, Bangalore',
      'image': 'assets/images/discover/comic_books.png',
    },
  ];

  BuySellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buy/Sell',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: const Color(0xFF279AF1),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search and My Listings
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to user's listings (functionality can be added later)
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('My Listings'),
                ),
              ],
            ),
          ),
          // Categories Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Browse by Categories',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return _buildCategoryCard(category);
              },
            ),
          ),
          // Listings Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Listings from My Community',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listings.length,
              itemBuilder: (context, index) {
                final listing = listings[index];
                return _buildListingCard(context, listing);
              },
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemPage()),
          );
        },
        backgroundColor: const Color(0xFF0065FD),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Category Card
  Widget _buildCategoryCard(Map<String, dynamic> category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: const Color(0xFF73A8F7),
            child: Icon(category['icon'],
                color: const Color(0xFFFFFFFF), size: 30.0),
          ),
          const SizedBox(height: 8.0),
          Text(category['name'], style: const TextStyle(fontSize: 14.0)),
        ],
      ),
    );
  }

  // Listing Card
  Widget _buildListingCard(BuildContext context, Map<String, dynamic> listing) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailsPage(listing: listing),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListTile(
          leading:
              Image.asset(listing['image'], width: 50.0, fit: BoxFit.cover),
          title: Text(listing['title'],
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(listing['price']),
              Text(listing['location'],
                  style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          trailing: Chip(
            label: Text(listing['status']),
            backgroundColor: listing['status'] == 'FREE'
                ? Colors.green[100]
                : Colors.red[100],
          ),
        ),
      ),
    );
  }
}
