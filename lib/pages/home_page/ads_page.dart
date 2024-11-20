import 'package:flutter/material.dart';

class AdsPage extends StatelessWidget {
  final String imageUrl;
  final String adText;

  const AdsPage({
    super.key,
    required this.imageUrl,
    required this.adText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(adText),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ad Image Section
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Ad Title
              Text(
                adText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Description Section
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "This is a detailed description of the selected ad. It provides all necessary information about the offer, how it works, and why it's beneficial. This text serves as a placeholder for the actual ad description.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Handle "More Details" button click
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("More details coming soon!"),
                    ),
                  );
                },
                child: const Text(
                  "More details",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Reviews Section
              const Text(
                "Reviews",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildReviewItem("John Doe", "Great service! Highly recommend."),
              const SizedBox(height: 8),
              _buildReviewItem("Jane Smith", "Quick and reliable."),
            ],
          ),
        ),
      ),
    );
  }

  // Review Item Widget
  Widget _buildReviewItem(String reviewer, String comment) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.person, size: 40, color: Colors.grey),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reviewer,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                comment,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
