import 'package:flutter/material.dart';
import 'package:maveli_mart/utils/colors.dart';

class LiveGalaBookingScreen extends StatefulWidget {
  const LiveGalaBookingScreen({super.key});

  @override
  State<LiveGalaBookingScreen> createState() => _LiveGalaBookingScreenState();
}

class _LiveGalaBookingScreenState extends State<LiveGalaBookingScreen> {
  // Local static colors (or import directly from colors.dart)
  static const primaryGreen = Color(0xFF228B22);
  static const cardBg = Color(0xFFFDF5E6);
  static const borderTone = Color(0xFFEFE6D5);

  // Form & Ticket State
  int _seatCount = 1;
  int _pricePerSeat = 50;
  bool _isBooked = false;

  final TextEditingController _phoneController = TextEditingController(
    text: '+91 98XXX XXXX',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'guest@example.com',
  );

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int totalAmount = _seatCount * _pricePerSeat;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Maveli\'s Royal Gala',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
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
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // HERO EVENT CARD
                        Container(
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: borderTone, width: 1.5),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundColor: primaryGreen,
                                          child: const Text(
                                            '🎭',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Live Speech & Dance Gala',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily: 'NotoSerif',
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              Row(
                                                children: const [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    size: 14,
                                                    color: labelColor,
                                                  ),
                                                  SizedBox(width: 2),
                                                  Text(
                                                    'Ernakulam Town Hall',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: labelColor,
                                                      fontFamily: 'Vietnam',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    const Divider(height: 1, color: borderTone),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Date',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: labelColor,
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              'Uthradam Day',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Time',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: labelColor,
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              '6:00 PM',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
          
                              // CHARITY BANNER AT FOOTER OF CARD
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 12,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFDE8E8),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('👶 ', style: TextStyle(fontSize: 12)),
                                    Text(
                                      'Proceeds go entirely to Children\'s Welfare Funds',
                                      style: TextStyle(
                                        color: Color(0xFF901A1A),
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Vietnam',
                                      ),
                                    ),
                                    Text(' ❤️', style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
          
                        const SizedBox(height: 20),
          
                        // RESERVE YOUR SEATS SECTION TITLE
                        const Text(
                          'Reserve Your Seats',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                        const SizedBox(height: 12),
          
                        // INPUT & COUNTER CARD
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: borderTone, width: 1.5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Mobile Number',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Vietnam',
                                  color: labelColor,
                                ),
                              ),
                              const SizedBox(height: 6),
                              _buildCustomTextField(_phoneController),
          
                              const SizedBox(height: 14),
          
                              const Text(
                                'Email Address',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Vietnam',
                                  color: labelColor,
                                ),
                              ),
                              const SizedBox(height: 6),
                              _buildCustomTextField(_emailController),
          
                              const SizedBox(height: 16),
          
                              // SEAT COUNTER ROW
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Number of Seats',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Vietnam',
                                        ),
                                      ),
                                      Text(
                                        '₹$_pricePerSeat per seat',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: labelColor,
                                          fontFamily: 'Vietnam',
                                        ),
                                      ),
                                    ],
                                  ),
          
                                  // STEPPER CONTROLS
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: neutral,
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: borderTone),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          constraints: const BoxConstraints(
                                            minWidth: 32,
                                            minHeight: 32,
                                          ),
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(
                                            Icons.remove,
                                            size: 18,
                                            color: Colors.black87,
                                          ),
                                          onPressed: () {
                                            if (_seatCount > 1) {
                                              setState(() {
                                                _seatCount--;
                                              });
                                            }
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: Text(
                                            '$_seatCount',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Vietnam',
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          constraints: const BoxConstraints(
                                            minWidth: 32,
                                            minHeight: 32,
                                          ),
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(
                                            Icons.add,
                                            size: 18,
                                            color: primaryGreen,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _seatCount++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
          
                        const SizedBox(height: 20),
          
                        // REVEALABLE ENTRY PASS TICKET
                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 350),
                          crossFadeState: _isBooked
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          firstChild: const SizedBox(width: double.infinity),
                          secondChild: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('🎟️ ', style: TextStyle(fontSize: 14)),
                                  Text(
                                    'ENTRY PASS TICKET',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                      color: Colors.black87,
                                      fontFamily: 'Vietnam',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  // color: cardBg,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: primaryGreen.withValues(alpha: 0.4),
                                    width: 1.5,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    // QR BOX PREVIEW
                                    Container(
                                      width: double.infinity,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: neutral,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.qr_code_2,
                                          size: 85,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Divider(height: 1, color: borderTone),
                                    const SizedBox(height: 12),
          
                                    // DETAILS GRID
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'PASS ID',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: labelColor,
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              '#GALA-2026-9812',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: primaryGreen,
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                              'SEAT COUNT',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: labelColor,
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              '$_seatCount ${_seatCount > 1 ? "Seats" : "Seat"}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'VENUE',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: labelColor,
                                              fontFamily: 'Vietnam',
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            'Ernakulam Town Hall',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Vietnam',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 14),
          
                                    // INFO BANNER
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFF0DD),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.info_outline,
                                            size: 16,
                                            color: Color(0xFF8A5100),
                                          ),
                                          SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              'Show QR at the entry gate to receive your physical badge.',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Color(0xFF8A5100),
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          
                // BOTTOM BAR WITH DYNAMIC TOTAL PRICE
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: const BoxDecoration(
                    color: cardBg,
                    border: Border(top: BorderSide(color: borderTone)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Total Amount',
                            style: TextStyle(
                              fontSize: 12,
                              color: labelColor,
                              fontFamily: 'Vietnam',
                            ),
                          ),
                          Text(
                            '₹$totalAmount',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSerif',
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isBooked = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              _isBooked ? 'Seats Reserved! 🎉' : 'Book Seats',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Vietnam',
                              ),
                            ),
                            if (!_isBooked) ...[
                              const SizedBox(width: 6),
                              // const Text('🎟️', style: TextStyle(fontSize: 14)),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField(TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderTone),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 14, fontFamily: 'Vietnam'),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }
}
