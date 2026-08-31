import 'package:flutter/material.dart';
import 'package:maveli_mart/screens/home_screen.dart';
import 'package:maveli_mart/screens/maveli_tracker_screen.dart';
import 'package:maveli_mart/screens/maveli_zone_screen.dart';
import 'package:maveli_mart/screens/pookalam_store_screen.dart';
import 'package:maveli_mart/screens/praja_home_screen.dart';
import 'package:maveli_mart/screens/sadya_planner_screen.dart';
import 'package:maveli_mart/utils/colors.dart';

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _currentIndex = 0;

  // Callback function to change tab programmatically from inner widgets
  void _switchTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(
        onNavigateToSadya: () =>
            _switchTab(1), // Pass navigation callback to Home
        onNavigateToFlower: () => _switchTab(2),
      ),
      const SadyaPlannerScreen(),
      const PookalamStoreScreen(),
      const PrajaHubScreen(),
      const MaveliZoneDashboardScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Maveli Mart',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/trackerIcon.png',
              width: 30,
              height: 30,
              color: secondaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MaveliTrackerScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: const Color(0xFFF3ECE0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home, 'Home'),
            _buildNavItem(1, Icons.flatware, 'Sadya'),
            _buildNavItem(2, Icons.local_florist, 'Pookalam'),
            _buildNavItem(3, Icons.message, 'Connect'),
            _buildNavItem(4, Icons.wb_sunny, 'Maveli Zone'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16 : 8,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
              size: 18,
            ),
            if (isSelected) ...[
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
