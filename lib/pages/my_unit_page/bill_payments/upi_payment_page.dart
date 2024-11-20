import 'package:flutter/material.dart';

class UpiPaymentPage extends StatelessWidget {
  final double totalAmount; // Accept total balance as a parameter

  const UpiPaymentPage({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = 
        TextEditingController(text: totalAmount.toStringAsFixed(2));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0065FD),
        title: const Text('UPI Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter UPI ID',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'e.g., username@upi',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_balance_wallet),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Saved UPI IDs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_balance),
                    title: const Text('example1@upi'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Add selection logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0065FD),
                      ),
                      child: const Text('Select'),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_balance),
                    title: const Text('example2@upi'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Add selection logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0065FD),
                      ),
                      child: const Text('Select'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Amount to Pay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount in ₹',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.currency_rupee),
              ),
              keyboardType: TextInputType.number,
              readOnly: true, // Make the field read-only
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add payment logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0065FD),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                ),
                child: const Text(
                  'Proceed to Pay',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Ensure UPI ID and Amount are correct before proceeding.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
