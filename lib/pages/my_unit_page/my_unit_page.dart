import 'package:flutter/material.dart';

void main() {
  runApp(const MyUnitApp());
}

class MyUnitApp extends StatelessWidget {
  const MyUnitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyUnitPage(),
    );
  }
}

class MyUnitPage extends StatelessWidget {
  const MyUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Unit',
          style: TextStyle(color: Colors.black), // Black text for white AppBar
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF279AF1), // White AppBar
        elevation: 1, // Add subtle shadow for better contrast
        iconTheme: const IconThemeData(color: Colors.black), // Black icons
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Unit Info Section
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Unit No: A - Block-1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildInfoTile(Icons.people, "07", "Members"),
                          _buildInfoTile(Icons.pets, "03", "Pets"),
                          _buildInfoTile(
                              Icons.directions_car, "02", "Vehicles"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Gate Updates Section
              const Text(
                "Gate Updates",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildGateUpdateTile(Icons.person, "Visitor", "3 Today"),
                  _buildGateUpdateTile(
                      Icons.cleaning_services, "Helper", "3/4 in campus"),
                  _buildGateUpdateTile(
                      Icons.card_giftcard, "Parcel", "3 Yet to collect"),
                ],
              ),
              const SizedBox(height: 20),

              // My Dues Section
              const Text(
                "My Dues",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Overdue",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Maintenance Fee",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "₹5,300",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Payment action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // White button
                          foregroundColor: Colors.black, // Black text
                          side: const BorderSide(
                              color: Colors.black), // Black border
                        ),
                        child: const Text("PAY"),
                      ),
                      TextButton(
                        onPressed: () {
                          // History action
                        },
                        child: const Text("History"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Advance/Deposit action
                        },
                        child: const Text("Advance/Deposit"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "No Dues",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Maintenance Fee",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "₹0",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String count, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.black), // Black icon for visibility
        const SizedBox(height: 5),
        Text(
          count,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildGateUpdateTile(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.black), // Black icon for visibility
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(subtitle),
      ],
    );
  }
}
