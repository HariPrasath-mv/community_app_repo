import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'upi_payment_page.dart'; // Import UPI page
import 'wallet_payment_page.dart'; // Import Wallet page
import 'account_transfer_page.dart'; // Import Account Transfer page

class BillPaymentPage extends StatefulWidget {
  const BillPaymentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BillPaymentPageState createState() => _BillPaymentPageState();
}

class _BillPaymentPageState extends State<BillPaymentPage> {
  final Map<String, double> sampleValues = {
    'Electricity': 100.0,
    'Water': 50.0,
    'Internet': 500.0,
    'Phone': 30.0,
    'Cable TV': 45.0,
  };

  double get totalBalance => sampleValues.values.reduce((a, b) => a + b);

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0065FD),
        title: const Text('Bill Payments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a Category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: sampleValues.entries.map((entry) {
                return BillCategoryTile(
                  icon: [
                    'Electricity',
                    'Water',
                    'Internet',
                    'Phone',
                    'Cable TV'
                  ].contains(entry.key)
                      ? null // Pass null for these categories
                      : getCategoryIcon(entry.key),
                  label: entry.key,
                  amount: entry.value,
                  formatter: formatter,
                );
              }).toList(),
            ),
            const SizedBox(height: 32.0),
            Text(
              'Total Payment Balance: ${formatter.format(totalBalance)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Payment Methods',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                PaymentMethodTile(
                  icon: Icons.account_circle,
                  label: 'UPI',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpiPaymentPage(
                            totalAmount:
                                totalBalance), // Pass total balance here
                      ),
                    );
                  },
                ),
                PaymentMethodTile(
                  icon: Icons.account_balance_wallet,
                  label: 'Wallet',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WalletPaymentPage(totalAmount: totalBalance),
                      ),
                    );
                  },
                ),
                PaymentMethodTile(
                  icon: Icons.account_balance,
                  label: 'Account Transfer',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountTransferPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData getCategoryIcon(String category) {
    switch (category) {
      case 'Electricity':
        return Icons.electrical_services;
      case 'Water':
        return Icons.water;
      case 'Internet':
        return Icons.wifi;
      case 'Phone':
        return Icons.phone;
      case 'Cable TV':
        return Icons.tv;
      default:
        return Icons.category;
    }
  }
}

class BillCategoryTile extends StatelessWidget {
  final IconData? icon; // Made icon nullable
  final String label;
  final double amount;
  final NumberFormat formatter;

  const BillCategoryTile({
    super.key,
    this.icon, // Made optional
    required this.label,
    required this.amount,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? Icon(icon, size: 40)
          : null, // Show icon only if provided
      title: Text(label),
      trailing: Text(formatter.format(amount)),
      onTap: () {
        // Add navigation to specific bill payment page here if needed
      },
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 40, color: Colors.blue),
      title: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}
