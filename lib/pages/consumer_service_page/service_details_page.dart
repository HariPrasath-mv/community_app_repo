import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceDetailsPage extends StatelessWidget {
  final String title;
  final String iconPath;

  const ServiceDetailsPage({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(0xFF279AF1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and Title
            Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: 250,
                    width: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Description
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "This is a detailed description of the selected service. It provides all necessary information about what the service includes, how it works, and why it's beneficial.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Contact action
                  },
                  icon: const Icon(Icons.phone),
                  label: const Text("Contact"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Request Service action
                  },
                  icon: const Icon(Icons.request_quote),
                  label: const Text("Request Service"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Reviews Section (Optional)
            const Text(
              "Reviews",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("John Doe"),
                    subtitle: Text("Great service! Highly recommend."),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Jane Smith"),
                    subtitle: Text("Quick and reliable."),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
