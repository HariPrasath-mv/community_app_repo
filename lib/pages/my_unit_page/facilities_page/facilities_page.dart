import 'package:flutter/material.dart';
import 'facility_detail_page.dart'; // Import the detail page.

class FacilitiesPage extends StatelessWidget {
  final List<Map<String, String>> facilities = [
    {
      'name': 'Swimming Pool',
      'price': 'Free',
      'image': 'assets/images/facilities/swimming_pool.png'
    },
    {
      'name': 'Squash Court',
      'price': '₹ 100 per hour',
      'image': 'assets/images/facilities/squash_court.png'
    },
    {
      'name': 'Clubhouse',
      'price': 'Free',
      'image': 'assets/images/facilities/clubhouse.png'
    },
    {
      'name': 'Badminton Court',
      'price': '₹ 150 per hour',
      'image': 'assets/images/facilities/badminton_court.png'
    },
    {
      'name': 'Cricket Nets',
      'price': 'Free',
      'image': 'assets/images/facilities/cricket_nets.png'
    },
    {
      'name': 'Barbecue Pit',
      'price': '₹ 100 per hour',
      'image': 'assets/images/facilities/barbecue_pit.png'
    },
  ];

  FacilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facilities'),
        backgroundColor: const Color(0xFF0065FD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: facilities.length,
          itemBuilder: (context, index) {
            final facility = facilities[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FacilityDetailPage(
                      name: facility['name']!,
                      price: facility['price']!,
                      image: facility['image']!,
                    ),
                  ),
                );
              },
              child: FacilityCard(
                name: facility['name']!,
                price: facility['price']!,
                image: facility['image']!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class FacilityCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const FacilityCard(
      {super.key,
      required this.name,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(
                  price,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
