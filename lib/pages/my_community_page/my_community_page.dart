import 'package:flutter/material.dart';

class MyCommunityPage extends StatelessWidget {
  final List<String> communityMembers = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie Davis',
    'Dana Lee',
    'Eve Turner',
    'Frank Wright',
  ];

  MyCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Community'),
        centerTitle: true,
        backgroundColor: Color(0xFF279AF1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to My Community!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Here are some of the amazing members:',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: communityMembers.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          communityMembers[index][0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(communityMembers[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for adding new members can go here
        },
        tooltip: 'Add Member',
        child: Icon(Icons.add),
      ),
    );
  }
}