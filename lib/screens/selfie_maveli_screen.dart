import 'package:flutter/material.dart';
import 'package:maveli_mart/utils/colors.dart';

class SelfieWithMaveliScreen extends StatefulWidget {
  const SelfieWithMaveliScreen({super.key});

  @override
  State<SelfieWithMaveliScreen> createState() => _SelfieWithMaveliScreenState();
}

class _SelfieWithMaveliScreenState extends State<SelfieWithMaveliScreen> {
  // Local static colors (or import directly from colors.dart)
  static const primaryGreen = Color(0xFF228B22);
  static const cardBg = Color(0xFFFFFFFF);

  // State flag to control QR Code Swap
  bool _isBooked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Selfie with King Maveli',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700, // Caps maximum snackbar width for web screens
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 12.0,
                    ),
                    child: Column(
                      children: [
                        // HERO TITLE SECTION
                        const SizedBox(height: 8),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'NotoSerif',
                              height: 1.2,
                            ),
                            children: [
                              TextSpan(
                                text: 'Capture your Onam\nmemory',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Text('👑', style: TextStyle(fontSize: 30)),

                        const SizedBox(height: 4),
                        const Text(
                          'with King Maveli!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Vietnam',
                          ),
                        ),
                        const SizedBox(height: 20),

                        // VENUE & EVENT DETAILS CARD
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: neutral,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              _buildDetailRow(
                                icon: Icons.location_on,
                                iconColor: primaryGreen,
                                title: 'Tripunithura Layam Ground',
                                subtitle: 'Main Festival Stage',
                              ),
                              const Divider(
                                height: 24,
                                color: Color(0xFFF0EAE0),
                              ),
                              _buildDetailRow(
                                icon: Icons.access_time_filled,
                                iconColor: secondaryColor,
                                title: 'Tomorrow',
                                subtitle: '10:30 AM – 11:30 AM',
                              ),
                              const Divider(
                                height: 24,
                                color: Color(0xFFF0EAE0),
                              ),
                              _buildDetailRow(
                                icon: Icons.favorite,
                                iconColor: Colors.redAccent,
                                title: 'Charity Cause',
                                subtitle: 'Proceeds go to Care for Elderly',
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // KEEPSAKE CONTAINER WITH DASHED BORDER EFFECT
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: primaryGreen.withValues(alpha: 0.4),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                _isBooked
                                    ? 'Your Entry Pass Token'
                                    : 'Your Onam Keepsake',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: primaryGreen,
                                  fontFamily: 'NotoSerif',
                                ),
                              ),
                              const SizedBox(height: 16),

                              // POLAROID FRAME WITH INLINE ANIMATED SWAP
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: neutral,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.05,
                                      ),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: _isBooked
                                      ? // REVEALED QR PASS
                                        Container(
                                          key: const ValueKey('qrCode'),
                                          width: 180,
                                          height: 180,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Icon(
                                              Icons.qr_code_2,
                                              size: 150,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      : // DEFAULT SAMPLE ILLUSTRATION
                                        Stack(
                                          key: const ValueKey('illustration'),
                                          alignment: Alignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: Image.asset(
                                                'assets/images/maveliBg.png',
                                                width: 180,
                                                height: 180,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 180,
                                              height: 180,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Colors.black.withValues(
                                                  alpha: 0.7,
                                                ),
                                              ),
                                            ),
                                            const Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.lock_outline,
                                                  color: Colors.white,
                                                  size: 28,
                                                ),
                                                SizedBox(height: 6),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                  ),
                                                  child: Text(
                                                    'Book token to generate \n your pass',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Vietnam',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              Text(
                                _isBooked
                                    ? '#ONAM-2026-8942'
                                    : '#ONAM-2026-XXXX',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                  color: Colors.black,
                                  fontFamily: 'NotoSerif',
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _isBooked
                                    ? 'Show this QR at the photo counter'
                                    : 'Your unique QR will appear here',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: labelColor,
                                  fontFamily: 'Vietnam',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // BOTTOM ACTION BUTTON BAR
                Container(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isBooked = !_isBooked;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _isBooked
                                ? 'Token Reserved! 🎉'
                                : 'Book Token ( ₹50 )',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: "NotoSerif",
                            ),
                          ),
                          if (!_isBooked) ...[
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Vietnam',
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: labelColor,
                  fontFamily: 'Vietnam',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
