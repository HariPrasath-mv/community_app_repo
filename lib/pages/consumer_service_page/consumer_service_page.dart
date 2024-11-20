import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'service_details_page.dart';

class ConsumerServicePage extends StatelessWidget {
  const ConsumerServicePage({super.key});

  // Constant list of services with title and SVG icon paths
  static const List<Map<String, String>> services = [
    {
      'title': 'Appliance Repair',
      'icon': 'assets/icons/consumer_service/appliance_repair.svg'
    },
    {
      'title': 'Interior Painting',
      'icon': 'assets/icons/consumer_service/interior_painting.svg'
    },
    {
      'title': 'Furniture Assembly',
      'icon': 'assets/icons/consumer_service/furniture_assembly.svg'
    },
    {
      'title': 'Furniture Moving',
      'icon': 'assets/icons/consumer_service/furniture_moving.svg'
    },
    {
      'title': 'Junk Removal',
      'icon': 'assets/icons/consumer_service/junk_removal.svg'
    },
    {
      'title': 'Wedding Makeup',
      'icon': 'assets/icons/consumer_service/wedding_makeup.svg'
    },
    {
      'title': 'Limousine Services',
      'icon': 'assets/icons/consumer_service/limousine.svg'
    },
    {
      'title': 'AC Repair',
      'icon': 'assets/icons/consumer_service/ac_repair.svg'
    },
    {
      'title': 'Roof Repair',
      'icon': 'assets/icons/consumer_service/roof_repair.svg'
    },
    {
      'title': 'Plumbing Repair',
      'icon': 'assets/icons/consumer_service/plumbing_repair.svg'
    },
    {
      'title': 'Pest Control',
      'icon': 'assets/icons/consumer_service/pest_control.svg'
    },
    {
      'title': 'Sprinkler Repair',
      'icon': 'assets/icons/consumer_service/sprinkler_repair.svg'
    },
    {
      'title': 'Portrait Photography',
      'icon': 'assets/icons/consumer_service/portrait_photography.svg'
    },
    {
      'title': 'Wedding Officiant',
      'icon': 'assets/icons/consumer_service/wedding_officiant.svg'
    },
    {
      'title': 'Personal Chef',
      'icon': 'assets/icons/consumer_service/personal_chef.svg'
    },
    {'title': 'Handyman', 'icon': 'assets/icons/consumer_service/handyman.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumer Services'),
        centerTitle: true,
        backgroundColor: Color(0xFF279AF1),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return GestureDetector(
            onTap: () {
              // Navigate to details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDetailsPage(
                    title: service['title']!,
                    iconPath: service['icon']!,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  service['icon']!,
                  height: 64,
                  width: 64,
                ),
                const SizedBox(height: 8),
                Text(
                  service['title']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
