import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ItemDetailsPage extends StatelessWidget {
  final Map<String, dynamic> listing;

  const ItemDetailsPage({required this.listing, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: const Color(0xFF279AF1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _showImagePopup(context, listing['image']);
              },
              child: Image.asset(
                listing['image'],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              listing['title'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              listing['price'],
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 8.0),
            Text(
              listing['location'],
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePopup(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('Image Viewer',
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
          backgroundColor: Colors.black,
          body: PhotoView(
            imageProvider: AssetImage(imagePath),
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
            heroAttributes: const PhotoViewHeroAttributes(tag: "imageHero"),
          ),
        ),
      ),
    );
  }
}
