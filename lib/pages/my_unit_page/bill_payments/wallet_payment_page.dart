import 'package:flutter/material.dart';

class WalletPaymentPage extends StatefulWidget {
  final double totalAmount; // Amount from Bill Payment Page

  const WalletPaymentPage({super.key, required this.totalAmount});

  @override
  State<WalletPaymentPage> createState() => _WalletPaymentPageState();
}

class _WalletPaymentPageState extends State<WalletPaymentPage> {
  double walletBalance = 500.0; // Initial wallet balance

  @override
  Widget build(BuildContext context) {
    double amountNeeded = widget.totalAmount - walletBalance;
    bool isBalanceLow = walletBalance < widget.totalAmount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0065FD),
        title: const Text('Wallet Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Wallet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Wallet Balance:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹${walletBalance.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
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
                  controller: TextEditingController(
                      text: widget.totalAmount.toStringAsFixed(2)),
                  decoration: const InputDecoration(
                    labelText: 'Amount in ₹',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.currency_rupee),
                  ),
                  readOnly: true, // Prevent editing
                ),
                const SizedBox(height: 20.0),
                if (isBalanceLow)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Insufficient Balance',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'You need ₹${amountNeeded.toStringAsFixed(2)} more to complete the payment.',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 10.0, height: 14.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            walletBalance +=
                                amountNeeded; // Add the required amount
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0065FD),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 14.0),
                        ),
                        child: Text(
                          'Add ₹${amountNeeded.toStringAsFixed(2)} to Wallet',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (walletBalance >= widget.totalAmount) {
                    setState(() {
                      walletBalance -= widget.totalAmount; // Deduct the amount
                    });
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Payment Successful'),
                        content: const Text('Your payment has been completed.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Insufficient Balance'),
                        content: const Text(
                          'Please add more money to your wallet to proceed.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'OK',
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0065FD),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100.0, vertical: 15.0),
                ),
                child: const Text(
                  'Proceed to Pay',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
