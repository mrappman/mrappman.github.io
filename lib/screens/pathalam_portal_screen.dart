import 'package:flutter/material.dart';
import 'package:maveli_mart/screens/pathalam_view_detail_screen.dart';
import 'package:maveli_mart/screens/pathalam_yatra_screen.dart';
import 'package:maveli_mart/utils/colors.dart';

class PathalamPortalScreen extends StatefulWidget {
  const PathalamPortalScreen({super.key});

  @override
  State<PathalamPortalScreen> createState() => _PathalamPortalScreenState();
}

class _PathalamPortalScreenState extends State<PathalamPortalScreen> {
  static const primaryGreen = Color(0xFF228B22);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Pathalam Portal',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Choose your journey to the Pathalam Realm.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        height: 1.3,
                        fontFamily: 'Vietnam',
                      ),
                    ),
                    const SizedBox(height: 24),
                      
                    // Card 1: Pathalam Pass
                    _buildOptionCard(
                      imageUrl:
                          'assets/images/pathalam_bg.webp', // Replace with Portal Gate image asset
                      title: 'Pathalam Pass',
                      subtitle: 'Visit Pathalam physically',
                      buttonText: 'Get Royal Pass',
                      buttonIcon: Icons.arrow_forward,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoyalPassScreen(),
                          ),
                        );
                      },
                    ),
                      
                    const SizedBox(height: 20),
                      
                    // Card 2: Pathalam View
                    _buildOptionCard(
                      imageUrl: 'assets/images/pathalam_view_bg.webp',
                      title: 'Pathalam View',
                      subtitle: 'Experience it remotely',
                      buttonText: 'Put on PV Glasses',
                      buttonIcon: Icons.visibility_outlined,
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PathalamViewDetailScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String buttonText,
    required IconData buttonIcon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(imageUrl, height: 170, fit: BoxFit.cover),
          ),

          // Content Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'NotoSerif',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    fontFamily: 'Vietnam',
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Vietnam',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(buttonIcon, color: Colors.white, size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
