import 'package:flutter/material.dart';
import 'package:maveli_mart/utils/colors.dart';

class PathalamViewDetailScreen extends StatelessWidget {
  const PathalamViewDetailScreen({super.key});

  static const primaryGreen = Color(0xFF228B22);
  static const backgroundColor = Color(0xFFFDF5E6);
  static const cardBorderColor = Color(0xFFEFE6D5);
  static const accentGold = Color(0xFFFF8C00);

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
        title: const Text(
          'Pathalam View',
          style: TextStyle(
            color: primaryGreen,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: 'NotoSerif',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700, // Caps maximum snackbar width for web screens
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Column(
              children: [
                // Product Hero Image Card
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'assets/images/pv_glass.png', // Replace with PV Glasses hero asset
                    width: double.infinity,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                // Category Tag
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: accentGold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'PREMIUM ONAM TECH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      fontFamily: 'Vietnam',
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Title
                const Text(
                  'PV — Pathalam View',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                    fontFamily: 'NotoSerif',
                  ),
                ),
                const SizedBox(height: 6),

                // Tagline
                const Text(
                  'Pathalam. Live. From wherever you are.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'Vietnam',
                  ),
                ),
                const SizedBox(height: 12),

                // Long Description Body
                const Text(
                  'Experience the grandeur of King Mahabali\'s realm directly. These luxury smart glasses blend traditional Kerala elegance with cutting-edge augmented reality, bringing the festivities of Pathalam to your eyes.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: labelColor,
                    height: 1.4,
                    fontFamily: 'Vietnam',
                  ),
                ),
                const SizedBox(height: 28),

                // Divine Features Header
                const Text(
                  'Divine Features',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                    fontFamily: 'NotoSerif',
                  ),
                ),
                const SizedBox(height: 4),
                Container(width: 40, height: 3, color: accentGold),
                const SizedBox(height: 20),

                // Feature List Cards
                _buildFeatureCard(
                  icon: Icons.visibility,
                  iconBgColor: primaryGreen,
                  title: 'Live Pathalam View',
                  description:
                      'Real-time HD streaming of the underwater kingdom\'s ongoing celebrations.',
                ),
                _buildFeatureCard(
                  icon: Icons.fort,
                  iconBgColor: secondaryColor,
                  title: 'AI Pathalam Guide',
                  description:
                      'Your personal intelligent companion translating ancient scripts and lore.',
                ),
                _buildFeatureCard(
                  icon: Icons.record_voice_over,
                  iconBgColor: tertiaryColor,
                  title: 'Talk to Maveli',
                  description:
                      'Direct audio link to request blessings or ask questions to the King himself.',
                ),
                _buildFeatureCard(
                  icon: Icons.explore,
                  iconBgColor: const Color(0xFF7A8B58),
                  title: 'Explore Pathalam',
                  description:
                      'Interactive maps to navigate the vast, glowing caverns virtually.',
                ),

                const SizedBox(height: 24),

                // Pricing Section
                _buildPricingContainer(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Vietnam',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: labelColor,
              height: 1.3,
              fontFamily: 'Vietnam',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: cardBorderColor),
      ),
      child: Column(
        children: [
          // BUY Option
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Icon(
                  Icons.workspace_premium,
                  color: accentGold,
                  size: 28,
                ),
                const SizedBox(height: 6),
                const Text(
                  'BUY PV',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontFamily: 'Vietnam',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '₹24,999',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                    fontFamily: 'Vietnam',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Own the ultimate portal to Pathalam forever. Includes a premium handcrafted wooden case.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: labelColor,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      showToast(
                        context,
                        "Portal order submitted! Redirecting to checkout...",
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'BUY NOW',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: 'Vietnam',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: cardBorderColor),

          // RENT Option
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Color(0xFFB8A22A),
                  size: 24,
                ),
                const SizedBox(height: 6),
                const Text(
                  'RENT PV',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontFamily: 'Vietnam',
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: const TextSpan(
                    text: '₹499 ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Vietnam',
                    ),
                    children: [
                      TextSpan(
                        text: '/ day',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Perfect for the Onam season. Experience the magic without the long-term commitment.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: labelColor,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: OutlinedButton(
                    onPressed: () {
                      showToast(
                        context,
                        "Daily rental pass added to your festive cart!",
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: accentGold, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'RENT NOW',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: 'Vietnam',
                      ),
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

  void showToast(BuildContext context, String titleContent) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 3),
        backgroundColor:
            primaryColor, // Make sure primaryColor is available in scope
        content: SafeArea(
          child: Row(
            mainAxisSize: MainAxisSize.min, // Compact horizontally
            mainAxisAlignment:
                MainAxisAlignment.center, // Center contents within the row
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                titleContent,
                style: const TextStyle(
                  fontFamily: "Vietnam",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
