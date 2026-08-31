import 'package:flutter/material.dart';
import 'package:maveli_mart/screens/customize_maveli_screen.dart';
import 'package:maveli_mart/screens/maveli_gala_screen.dart';
import 'package:maveli_mart/screens/pathalam_express_screen.dart';
import 'package:maveli_mart/screens/pathalam_portal_screen.dart';
import 'package:maveli_mart/screens/pathalam_thaaliola_screen.dart';
import 'package:maveli_mart/screens/selfie_maveli_screen.dart';
import 'package:maveli_mart/utils/colors.dart';

class MaveliZoneDashboardScreen extends StatelessWidget {
  const MaveliZoneDashboardScreen({super.key});

  static const primaryGreen = Color(0xFF228B22);
  static const bgCream = Color(0xFFFAF4E8);
  static const cardBg = Color(0xFFFFFBF3);
  static const borderTone = Color(0xFFEFE6D5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700, // Maximum width for web screens
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER BANNER
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to Maveli Zone!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Style the King, grab selfie passes, book event seats, order special goods, summon palm-leaf readings, and explore Pathalam passages.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            height: 1.3,
                            fontFamily: 'Vietnam',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 1. CUSTOMIZE MAVELI
                  _buildDashboardCard(
                    context: context,
                    emoji: '👑',
                    badgeText: 'Interactive',
                    title: 'Customize Maveli',
                    subtitle:
                        'Dress up King Maveli with royal rides, shades, and costumes to welcome him to your home!',
                    actionText: 'Style Maveli',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomizeMaveliScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // 2. SELFIE WITH MAVELI
                  _buildDashboardCard(
                    context: context,
                    emoji: '📸',
                    badgeText: 'Tripunithura Ground • 10:30 AM',
                    title: 'Selfie with Maveli',
                    subtitle:
                        'Get your photo token pass to snap a picture with King Maveli at the venue.',
                    actionText: 'Get Photo Pass',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelfieWithMaveliScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // 3. COMMUNITY & CHARITY EVENTS
                  _buildDashboardCard(
                    context: context,
                    emoji: '🎭',
                    badgeText: 'Children Welfare Cause',
                    title: 'Live Speech & Dance Gala',
                    subtitle:
                        'Reserve auditorium seats to watch King Maveli\'s speech and traditional performance.',
                    actionText: 'Book Seats',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LiveGalaBookingScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // 4. PATHALAM EXPRESS
                  _buildDashboardCard(
                    context: context,
                    emoji: '📦',
                    badgeText: '100% Proceeds to Kerala Dev',
                    title: 'Pathalam Express',
                    subtitle:
                        'Request special items from Pathalam and King Maveli will bring them on his journey!',
                    actionText: 'Order from Pathalam',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PathalamExpressScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  _buildDashboardCard(
                    context: context,
                    emoji: '📜',
                    badgeText: 'Royal Destiny Decree',
                    title: 'Pathalam Thaaliola',
                    subtitle:
                        'Summon your personal palm-leaf reading from Pathalam using your birth date & time to reveal your past, present, and future!',
                    actionText: 'Request Thaaliola',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PathalamThaaliolaScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  _buildDashboardCard(
                    context: context,
                    emoji: '🌌',
                    badgeText: '365-Day Realm Expedition',
                    title: 'Pathalam Yatra',
                    subtitle:
                        'Follow King Maveli back to his realm. Choose your path—secure a physical portal pass or view Pathalam live in augmented reality.',
                    actionText: 'Explore Passages',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PathalamPortalScreen(),
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
      ),
    );
  }

  Widget _buildDashboardCard({
    required BuildContext context,
    required String emoji,
    required String badgeText,
    required String title,
    required String subtitle,
    required String actionText,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Column(
        children: [
          // ICON AVATAR
          Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF1E4CE),
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 36)),
            ),
          ),
          const SizedBox(height: 16),

          // TITLE & SUBTITLE
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: primaryColor,
              fontFamily: 'NotoSerif',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: labelColor,
              height: 1.4,
              fontFamily: "Vietnam",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),

          // ACTION LINK
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  actionText,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                    fontFamily: "Vietnam",
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right, color: primaryColor, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
