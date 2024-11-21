import 'package:flutter/material.dart';
import 'bill_payments/bill_payment_page.dart';
import '../consumer_service_page/consumer_service_page.dart'; // Import the Consumer Service Page
import '../my_unit_page/gatekeeper_page/gatekeeper_page.dart'; // Import the Gatekeeper Page
import '../my_unit_page/helpdesk_page/helpdesk_page.dart'; 
import '../my_unit_page/grocery_page/grocery_page.dart';
// Import the Helpdesk Page
// import '../my_unit_page/dining_page.dart'; // Import the Dining Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyUnitPage(), // Set the MyUnitPage as the home page
    );
  }
}

class MyUnitPage extends StatelessWidget {
  const MyUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Unit'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unit info section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Unit No: A - Block-1',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.house_rounded, size: 30),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _infoCard('07', 'Members'),
                      _infoCard('03', 'Pets'),
                      _infoCard('02', 'Vehicles'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Pending dues section with navigation
            GestureDetector(
              onTap: () {
                // Navigate to BillPaymentPage when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BillPaymentPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.credit_card, color: Colors.red),
                        SizedBox(width: 10),
                        Text(
                          'Pending Due:',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ],
                    ),
                    Text(
                      '₹5,300',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Menu section
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu Options',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to a new page or expand more options
                  },
                  child: Text(
                    'View More',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 160, // Adjusted height for the menu items container
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _menuItem(context, Icons.payment, 'Bill Payments',
                      BillPaymentPage()),
                  _menuItem(context, Icons.shopping_cart, 'Groceries',
                      GroceryPage()),
                  _menuItem(
                      context, Icons.security, 'Gatekeeper', GatekeeperPage()),
                  _menuItem(context, Icons.restaurant, 'Dining', DiningPage()),
                  _menuItem(context, Icons.help, 'Help Desk', HelpdeskPage()),
                  _menuItem(context, Icons.access_alarm, 'My Passes',
                      ConsumerServicePage()), // You can rename this item as needed
                  _menuItem(context, Icons.build, 'Request Service',
                      ConsumerServicePage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }

  // Helper method to create menu items
  Widget _menuItem(
      BuildContext context, IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 110,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.grey, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(label,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}


class DiningPage extends StatelessWidget {
  const DiningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dining')),
        body: Center(child: Text('Dining Page')));
  }
}
