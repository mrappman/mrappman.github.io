import 'package:flutter/material.dart';
import 'package:maveli_mart/screens/pathalam_builder_screen.dart';
import 'package:maveli_mart/utils/colors.dart'; // Adjust import path

class RoyalPassScreen extends StatefulWidget {
  const RoyalPassScreen({super.key});

  @override
  State<RoyalPassScreen> createState() => _RoyalPassScreenState();
}

class _RoyalPassScreenState extends State<RoyalPassScreen> {
  bool _isOathTaken = false;

  void _showLifeInPathalamModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (_, controller) {
            return Container(
              decoration: const BoxDecoration(
                color: neutral,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      children: [
                        const Text(
                          'One-Year Living Conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "NotoSerif",
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'A glimpse into the subterranean paradise where prosperity reigns supreme.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: labelColor,
                            height: 1.3,
                            fontFamily: "Vietnam",
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Eternal Feast Mode Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFEFE6D5)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/images/pathalam_feast.png',
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        height: 160,
                                        color: const Color(0xFFF3EBDD),
                                        child: const Icon(
                                          Icons.restaurant_menu,
                                          size: 48,
                                          color: primaryColor,
                                        ),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.flatware,
                                          color: Color(0xFFD84315),
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Eternal Feast Mode',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                            fontFamily: "NotoSerif",
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Every day is a celebration. Enjoy endless Payasam in a realm where no one suffers from poverty or sickness.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: labelColor,
                                        height: 1.4,
                                        fontFamily: "Vietnam",
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Wrap(
                                      spacing: 8,
                                      children: [
                                        _buildTagChip('Endless Prosperity'),
                                        _buildTagChip('Perfect Health'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Earthly Reflection Mirror Card
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFEFE6D5)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Earthly Reflection Mirror',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      fontFamily: "NotoSerif",
                                    ),
                                  ),
                                  Icon(
                                    Icons.groups_outlined,
                                    color: Color(0xFF8D4B08),
                                    size: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Send digital Maveli Postcards to your family while you dwell in the subterranean paradise.',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: labelColor,
                                  height: 1.3,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                              const SizedBox(height: 12),
                              OutlinedButton.icon(
                                onPressed: null,
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Color(0xFFEFE6D5),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                icon: const Icon(Icons.send_outlined, size: 14),
                                label: const Text(
                                  'Compose Postcard',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Vietnam",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Got It',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Vietnam",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTagChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: primaryColor,
          fontFamily: "Vietnam",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        title: const Text(
          'Royal Pathalam',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontFamily: 'NotoSerif',
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700, // Caps maximum snackbar width for web screens
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Full Royal Pass Card
                    _buildPassCard(),

                    const SizedBox(height: 20),

                    // The Oath Section
                    const Text(
                      'The Oath of the Praja',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontFamily: "NotoSerif",
                      ),
                    ),
                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBF3),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFEFE6D5)),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: _isOathTaken,
                            activeColor: primaryColor,
                            onChanged: (val) {
                              setState(() {
                                _isOathTaken = val ?? false;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text(
                              'I promise to uphold peace and harmony in Pathalam until King Maveli returns to Earth.',
                              style: TextStyle(
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                height: 1.4,
                                fontFamily: "Vietnam",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Pass Activated CTA & QR Code Section
                    if (_isOathTaken) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Pass Activated / Boarding Confirmed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Vietnam",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // QR Code Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFEFE6D5)),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/qr_code_placeholder.png',
                              height: 110,
                              width: 110,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.qr_code_2,
                                    size: 90,
                                    color: Colors.black87,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'SCAN AT PORTAL GATE',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: labelColor,
                                fontFamily: "Vietnam",
                              ),
                            ),
                            const Divider(height: 20, color: Color(0xFFEFE6D5)),

                            // Link trigger for Pop-up Modal
                            TextButton.icon(
                              onPressed: () =>
                                  _showLifeInPathalamModal(context),
                              icon: const Icon(
                                Icons.info_outline,
                                size: 16,
                                color: primaryColor,
                              ),
                              label: const Text(
                                'View One-Year Living Conditions ➔',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                  fontFamily: "Vietnam",
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Add this below the QR Code Card container
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFBF3),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFEFE6D5)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.location_city,
                                  color: secondaryColor,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Pathalam Builders',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor,
                                    fontFamily: 'NotoSerif',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Loved your stay? Explore plots, royal havelis, and permanent living options in King Maveli’s realm.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'Vietnam',
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PathalamBuildersScreen(),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: primaryColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Explore Land & Properties →',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Vietnam',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ////////////////////////////////
                    ] else ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Center(
                          child: Text(
                            'Confirm Royal Passage',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Vietnam",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'You must take the oath to proceed.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                          fontFamily: "Vietnam",
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Complete Pass Card with all detail rows
  Widget _buildPassCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'PATHALAM ROYAL PASS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    fontFamily: "Vietnam",
                  ),
                ),
                Icon(Icons.vpn_key_outlined, color: Colors.amber, size: 18),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Avatar + Name Row
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        //border: Border.all(color: const Color(0xFFEFE6D5)),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/defaultProfile.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PRAJA',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Vietnam",
                          ),
                        ),
                        const Text(
                          'Rahul',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontFamily: "NotoSerif",
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 12,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Identity Confirmed',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Origin & Destination Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPassDetailColumn(
                      label: 'Origin',
                      value: 'Earth\n(Bhoolokam)',
                      valueColor: Colors.black87,
                    ),
                    _buildPassDetailColumn(
                      label: 'Destination',
                      value: 'Royal Pathalam',
                      valueColor: primaryColor,
                      alignRight: true,
                    ),
                  ],
                ),

                const Divider(height: 24, color: Color(0xFFEFE6D5)),

                // Return Date Section
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Return Date',
                        style: TextStyle(
                          fontSize: 11,
                          color: labelColor,
                          fontFamily: "Vietnam",
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Return: Next Thiruvonam',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8D4B08),
                          fontFamily: "Vietnam",
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Validity Text & Royal Seal Footer Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Valid: Thiruvonam 2026 -\nThiruvonam 2027',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black87,
                        height: 1.2,
                        fontFamily: "Vietnam",
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.workspace_premium,
                          size: 18,
                          color: tertiaryColor,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'ROYAL\nSEAL',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: tertiaryColor,
                            height: 1.1,
                            fontFamily: "Vietnam",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassDetailColumn({
    required String label,
    required String value,
    required Color valueColor,
    bool alignRight = false,
  }) {
    return Column(
      crossAxisAlignment: alignRight
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: labelColor,
            fontFamily: "Vietnam",
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          textAlign: alignRight ? TextAlign.end : TextAlign.start,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: valueColor,
            fontFamily: "Vietnam",
          ),
        ),
      ],
    );
  }
}
