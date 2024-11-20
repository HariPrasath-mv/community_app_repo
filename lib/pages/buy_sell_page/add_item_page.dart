import 'package:flutter/material.dart';

class AddItemPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Add Item', style: TextStyle(color: Color(0xFFFFFFFF))),
        backgroundColor: const Color(0xFF279AF1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Image Upload Button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle image upload
                },
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload Image'),
              ),
              const SizedBox(height: 16.0),
              // Category Dropdown
              DropdownButtonFormField(
                items: ['Properties', 'Electronics', 'Furniture', 'Vehicles']
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              // Product Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              // Price
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Expected Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
