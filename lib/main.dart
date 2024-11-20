import 'package:flutter/material.dart';
import 'sign_up_page/signup.dart';
import 'login.dart';
import 'pages/home_page/home_page.dart';
import 'pages/my_unit_page/my_unit_page.dart';
import 'pages/my_community_page/my_community_page.dart';
import 'pages/buy_sell_page/buy_sell_page.dart';
import 'pages/consumer_service_page/consumer_service_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
      home: const SignupPage(), // Start with the signup page
      routes: {
        '/main': (context) => const MainScreen(), // Navigation to the main screen
        '/login': (context) => const LoginPage(), // Navigation to the login screen
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const MyUnitPage(),
    MyCommunityPage(),
    BuySellPage(),
    const ConsumerServicePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0065FD),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.apartment), label: "My Unit"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "My Community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Buy/Sell"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Services"),
        ],
      ),
    );
  }
}
