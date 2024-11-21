import 'dart:async';
import 'package:flutter/material.dart';
import '../Profile_page/profile_page.dart';
import 'ads_page.dart';
import 'notification_page.dart';
import '../my_unit_page/dues_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentAdIndex = 0;
  late AnimationController _animationController;

  final List<Map<String, String>> _ads = [
    {
      'image':
          'https://images.unsplash.com/photo-1657664072464-e525da1d426e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': '50% Off on New Fashion Collection!',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1595461240565-1f5779bc1d2b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Exclusive Deals for Community Members!',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1628336707631-68131ca720c3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': "Upcoming Yoga Session: Don’t Miss Out!",
    },
    {
      'image':
          'https://images.unsplash.com/photo-1595877786670-393ef0ac0961?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Join the Gardening Club today!',
    },
  ];

  final List<Map<String, String>> _announcements = [
    {
      'title': 'Electric Vehicle Charging',
      'description':
          'Dear Residents, Electric Vehicle Charging Point Installation Guidelines of Resident is r ...',
      'date': '22 May 2022, 12:00 AM',
    },
    {
      'title': 'Inauguration Event',
      'description': 'Please join us for the inauguration ceremony ...',
      'date': '22 May 2022, 12:00 AM',
    },
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentAdIndex + 1;
        if (nextPage >= _ads.length) {
          _pageController.jumpToPage(0);
          nextPage = 0;
        } else {
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
        setState(() {
          _currentAdIndex = nextPage;
        });
      }
    });

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Welcome, User!',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Navigate to NotificationPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => _navigateToProfile(context),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150', // Replace with your image URL
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Ad Carousel Section
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _ads.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentAdIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to AdsPage with the ad details
                      Navigator.push(

                        context,
                        MaterialPageRoute(
                          builder: (context) => AdsPage(
                            imageUrl: _ads[index]['image']!,
                            adText: _ads[index]['text']!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 18),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4FCFF), // Background color
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _ads[index]['text']!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Explore ➔',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.network(
                            _ads[index]['image']!,
                            width: MediaQuery.of(context).size.width *
                                0.4, // 50% of the width
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _ads.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: 8, // Same size for both active and inactive indicators
                  decoration: BoxDecoration(
                    color: _currentAdIndex == index
                        ? const Color.fromRGBO(59, 193, 255, 1)
                        : Colors.grey, // Active and inactive colors
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Dues Section
            _buildInfoSection(
              context,
              'Dues',
              '₹ 6500.00',
              Icons.account_balance_wallet,
              Colors.orange,
            ),
            const SizedBox(height: 16),
            // Gate Updates Section
            _buildGateUpdatesSection(),
            const SizedBox(
                height:
                    32), // Added more space between Gate Updates and Announcements
            // Announcements Section
            _buildAnnouncementsSection(),
          ],
        ),
      ),
    );
  }

  

  Widget _buildInfoSection(BuildContext context, String title, String content,
    IconData icon, Color color) {
  return GestureDetector(
    onTap: () {
      if (title == 'Dues') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DuesPage()),
        );
      }
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, size: 30, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildGateUpdatesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Gate Updates',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Handle 'View All' press
                },
                child: const Text('View All',
                    style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          SizedBox(
            height: 120, // Height for the horizontal scroller
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildGateUpdateItem(
                    'Add Visitor', Icons.person_add, Colors.green),
                _buildGateUpdateItem('Find Helper', Icons.search, Colors.blue),
                _buildGateUpdateItem(
                    'Upcoming Visitor', Icons.upcoming, Colors.orange),
                _buildGateUpdateItem(
                    'Past Visitor', Icons.history, Colors.grey),
              ],
            ),
          ),
          const SizedBox(height: 0), // Added space below Gate Update items
        ],
      ),
    );
  }

  Widget _buildGateUpdateItem(String title, IconData icon, Color color) {
    return Container(
      width: 100, // Width for each item in the scroller
      margin: const EdgeInsets.only(
          right: 16, bottom: 10, top: 5), // Margin between items
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Announcements',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle 'View All' press
                },
                child: const Text('View All',
                    style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _announcements.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.only(right: 16, bottom: 10),
                  child: _buildAnnouncementCard(
                    _announcements[index]['title']!,
                    _announcements[index]['description']!,
                    _announcements[index]['date']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard(String title, String description, String date) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    );
  }
}
