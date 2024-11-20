import 'package:flutter/material.dart';

class AccountTransferPage extends StatelessWidget {
  const AccountTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Transfer'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text(
          'Account Transfer Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
