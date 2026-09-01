import 'package:flutter/material.dart';
import 'package:maveli_mart/screens/maveli_tracker_screen.dart';
import 'package:maveli_mart/screens/trivia_game_screen.dart';
import 'package:maveli_mart/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onNavigateToSadya;
  final VoidCallback onNavigateToFlower;

  const HomeScreen({
    super.key,
    required this.onNavigateToSadya,
    required this.onNavigateToFlower,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700, // Maximum width for web screens
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildHeroCard(),
                const SizedBox(height: 16),
                _buildCategoryCard(
                  imageUrl: "assets/images/sadhya.png",
                  icon: Icons.flatware,
                  title: 'Curated Sadyas',
                  description:
                      'Authentic ingredients and ready-to-eat feasts for your family.',
                  buttonText: 'Explore Menu ›',
                  onTap: onNavigateToSadya, // Linked callback
                ),
                const SizedBox(height: 16),
                _buildCategoryCard(
                  imageUrl: "assets/images/pookalam.png",
                  icon: Icons.local_florist,
                  title: 'Fresh Pookalams',
                  description:
                      'Vibrant petals and DIY kits to create stunning floral designs.',
                  buttonText: 'Shop Flowers ›',
                  onTap: onNavigateToFlower,
                ),
                const SizedBox(height: 16),
                _buildCategoryCard(
                  imageUrl: "assets/images/trivia.png",
                  icon: Icons.games,
                  title: 'Onam Trivia',
                  description:
                      'Test your knowledge of '
                      "Kerala's"
                      ' grandest festival with our interactive quiz.',
                  buttonText: 'Play Now ›',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TriviaGameScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildLiveTrackerCard(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hero Card Component
  Widget _buildHeroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.home, color: Colors.white, size: 14),
                SizedBox(width: 4),
                Text(
                  'Celebrate Onam 2026',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Vietnam",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Build Your Perfect\nOnam',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: primaryColor,
              height: 1.2,
              fontFamily: "NotoSerif",
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'From grand Sadyas to vibrant Pookalams, everything you need to welcome the King in style.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: labelColor,
              height: 1.4,
              fontFamily: "Vietnam",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Middle Category Cards
  Widget _buildCategoryCard({
    required String imageUrl,
    required IconData icon,
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                imageUrl,
                width: 95,
                height: 95,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: secondaryColor),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                  fontFamily: "NotoSerif",
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: labelColor,
              fontFamily: "Vietnam",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onTap,
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: primaryColor,
                fontFamily: "Vietnam",
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Live Tracker Bottom Card
  Widget _buildLiveTrackerCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 12),
                SizedBox(width: 4),
                Text(
                  'Live Tracker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Where is Maveli?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: primaryColor,
              fontFamily: "NotoSerif",
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'The beloved King is on his way! Track his journey across Kerala and see when he arrives in your district.',
            style: TextStyle(
              fontSize: 16,
              color: labelColor,
              fontFamily: "Vietnam",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),

          // Progress Tracker Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.grey.shade300,
              color: primaryColor,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pathanamthitta',
                style: TextStyle(fontSize: 10, color: labelColor),
              ),
              Text(
                'Ernakulam',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Text(
                'Thrissur',
                style: TextStyle(fontSize: 10, color: labelColor),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MaveliTrackerScreen(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: secondaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'View Tracker',
                style: TextStyle(
                  color: Color(0xFFA0522D),
                  fontSize: 14,
                  fontFamily: "Vietnam",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
