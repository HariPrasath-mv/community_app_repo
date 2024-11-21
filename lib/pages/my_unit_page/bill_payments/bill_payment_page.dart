import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'payment_data.dart';
import 'account_transfer_page.dart';
import 'upi_payment_page.dart';
import 'wallet_payment_page.dart';

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
    'Internet': 50.0,
    'Phone': 30.0,
    'Cable TV': 45.0,
  };

  // This will calculate the total balance from sample values
  double get totalBalance => sampleValues.values.reduce((a, b) => a + b);

  @override
  void initState() {
    super.initState();
    // Initialize total balance from sample values
    PaymentData().totalBalance = totalBalance; // Update PaymentData singleton
  }

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
}

class BillCategoryTile extends StatelessWidget {
  final String label;
  final double amount;
  final NumberFormat formatter;

  const BillCategoryTile({
    super.key,
    required this.label,
    required this.amount,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: Text(formatter.format(amount)),
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
