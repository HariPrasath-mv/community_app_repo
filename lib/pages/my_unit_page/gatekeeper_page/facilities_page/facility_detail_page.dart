import 'package:flutter/material.dart';

class FacilityDetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const FacilityDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color(0xFF0065FD),
      ),
      body: Column(
        children: [
          // Facility Image
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 250,
            width: double.infinity,
          ),
          const SizedBox(height: 16.0),

          // Facility Details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  price,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'About the Facility',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'This is a detailed description of the $name. It includes features, availability, and other important details about the facility. Make sure to check availability before visiting.',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
