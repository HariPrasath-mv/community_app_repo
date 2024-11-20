import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Define titles for navigation
  final Map<String, Widget> navigationPages = {
    "Personal Information": const PersonalInformationPage(),
    "Address Book": const PlaceholderPage("Address Book"),
    "My Payment Option": const PlaceholderPage("My Payment Option"),
    "Notification": const PlaceholderPage("Notification"),
    "Get Help": const PlaceholderPage("Get Help"),
    "Give Us Feedback": const PlaceholderPage("Give Us Feedback"),
    "Terms & Conditions": const PlaceholderPage("Terms & Conditions"),
    "Privacy Policy": const PlaceholderPage("Privacy Policy"),
  };

  // Navigate to the selected page
  void _navigateToPage(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => navigationPages[title] ?? const PlaceholderPage("Page Not Found"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProfileHeader(),
          const Divider(),
          _buildSectionTitle("Account Settings"),
          _buildListTile("Personal Information", Icons.person),
          _buildListTile("Address Book", Icons.location_on),
          _buildListTile("My Payment Option", Icons.payment),
          _buildListTile("Notification", Icons.notifications),
          const Divider(),
          _buildSectionTitle("Support"),
          _buildListTile("Get Help", Icons.help_outline),
          _buildListTile("Give Us Feedback", Icons.feedback),
          const Divider(),
          _buildSectionTitle("Legal"),
          _buildListTile("Terms & Conditions", Icons.description),
          _buildListTile("Privacy Policy", Icons.privacy_tip),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade300,
          child: const Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 10),
        const Text(
          "Username",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
          "username@example.com",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        TextButton(
          onPressed: () => _navigateToPage("Personal Information"),
          child: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () => _navigateToPage(title),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "$title Page",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Personal Information Page",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
