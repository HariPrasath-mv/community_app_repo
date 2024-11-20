import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample notifications data
    final List<Map<String, String>> notifications = [
      {
        'title': 'Maintenance Update',
        'description':
            'The community maintenance team will be visiting Block A tomorrow at 10 AM.',
        'date': '20 Nov 2024',
      },
      {
        'title': 'Holiday Announcement',
        'description': 'The community office will remain closed on 25th Dec.',
        'date': '19 Nov 2024',
      },
      {
        'title': 'New Parking Rules',
        'description': 'Please review the updated parking rules effective next week.',
        'date': '18 Nov 2024',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                notifications[index]['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notifications[index]['description']!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notifications[index]['date']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle individual notification tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Tapped on "${notifications[index]['title']}" notification.'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
