import 'package:flutter/material.dart';

class HelpdeskPage extends StatefulWidget {
  const HelpdeskPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelpdeskPageState createState() => _HelpdeskPageState();
}

class _HelpdeskPageState extends State<HelpdeskPage> {
  bool showMyRequests = false;
  int selectedTabIndex = 0; // 0 for "Open Issues", 1 for "Resolved Issues"

  final List<Map<String, dynamic>> issues = [
    {
      'id': 'P1422',
      'status': 'NEW',
      'title': 'Parking Issue',
      'description':
          'Car parking Reg no MH01-4456 is wrongly parked in my parking. Please clear the vehicle.',
      'date': '20 May 2024 8:00PM',
      'user': 'Roshan Kumar - B199',
      'replies': 3,
    },
    {
      'id': 'P1322',
      'status': 'IN PROGRESS',
      'title': 'Water Leakage from the ceiling',
      'description':
          'Water seepage has caused dampness on the ceiling and walls.',
      'date': '19 May 2024 5:34PM',
      'user': 'Roshan Kumar - B199',
      'replies': 5,
    },
    // Add more issues as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helpdesk', style: TextStyle(color: Color(0xFFFFFFFF))),
        backgroundColor: const Color(0xFF0065FD),
      ),
      body: Column(
        children: [
          // Unit & Tabs
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Unit No: Block 112-34',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    _buildTab('Open Issues', 0),
                    const SizedBox(width: 8.0),
                    _buildTab('Resolved Issues', 1),
                  ],
                ),
              ],
            ),
          ),
          // Toggle for filtering
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Show Requests raised by Me'),
                Switch(
                  value: showMyRequests,
                  onChanged: (value) {
                    setState(() {
                      showMyRequests = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Divider(thickness: 1.0),
          // Issues List
          Expanded(
            child: ListView.builder(
              itemCount: issues.length,
              itemBuilder: (context, index) {
                final issue = issues[index];
                return _buildIssueCard(issue);
              },
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new issue functionality
        },
        backgroundColor: const Color(0xFF0065FD),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Tab Builder
  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: selectedTabIndex == index
              ? const Color(0xFF0065FD)
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedTabIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Issue Card
  Widget _buildIssueCard(Map<String, dynamic> issue) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Badge
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: issue['status'] == 'NEW' ? Colors.red : Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    issue['status'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                ),
                const Spacer(),
                Text(
                  issue['id'],
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Title
            Text(
              issue['title'],
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            // Description
            Text(
              issue['description'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8.0),
            // Footer
            Row(
              children: [
                Text(
                  issue['date'],
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[500]),
                ),
                const Spacer(),
                Text(
                  '${issue['replies']} Replies',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
