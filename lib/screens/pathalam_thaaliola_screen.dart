import 'package:flutter/material.dart';
import 'package:maveli_mart/utils/colors.dart'; // Adjust import path

class PathalamThaaliolaScreen extends StatefulWidget {
  const PathalamThaaliolaScreen({super.key});

  @override
  State<PathalamThaaliolaScreen> createState() =>
      _PathalamThaaliolaScreenState();
}

class _PathalamThaaliolaScreenState extends State<PathalamThaaliolaScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isLoading = false;
  bool _hasResult = false;

  void _submitRequest() async {
    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select both birth date and time for the royal decree!',
            style: TextStyle(fontFamily: "Vietnam"),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate Pathalam fetch request delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      _hasResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pathalam Thaaliola',
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
              constraints: const BoxConstraints(
                maxWidth: 700, // Caps maximum snackbar width for web screens
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Banner Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBF3),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFEFE6D5)),
                      ),
                      child: Row(
                        children: [
                          const Text('📜', style: TextStyle(fontSize: 36)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Royal Decree of Fate',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1B4D2E),
                                    fontFamily: "NotoSerif",
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Share your birth details to summon your personal palm-leaf reading directly from King Maveli’s realm.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: labelColor,
                                    height: 1.3,
                                    fontFamily: "Vietnam",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Form Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFEFE6D5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Praja Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontFamily: "NotoSerif",
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Date Picker Row
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Color(0xFFEFE6D5)),
                            ),
                            leading: const Icon(
                              Icons.calendar_today,
                              color: primaryColor,
                            ),
                            title: Text(
                              _selectedDate == null
                                  ? 'Select Date of Birth'
                                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Vietnam",
                              ),
                            ),
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1940),
                                lastDate: DateTime.now(),
                              );
                              if (picked != null) {
                                setState(() => _selectedDate = picked);
                              }
                            },
                          ),
                          const SizedBox(height: 12),

                          // Time Picker Row
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Color(0xFFEFE6D5)),
                            ),
                            leading: const Icon(
                              Icons.access_time,
                              color: primaryColor,
                            ),
                            title: Text(
                              _selectedTime == null
                                  ? 'Select Time of Birth'
                                  : _selectedTime!.format(context),
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Vietnam",
                              ),
                            ),
                            onTap: () async {
                              final picked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (picked != null) {
                                setState(() => _selectedTime = picked);
                              }
                            },
                          ),
                          const SizedBox(height: 16),

                          // Submit Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _isLoading ? null : _submitRequest,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: _isLoading
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Icon(
                                      Icons.auto_awesome,
                                      color: Colors.white,
                                    ),
                              label: Text(
                                _isLoading
                                    ? 'Fetching from Pathalam...'
                                    : 'Request Thaaliola',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Results Section (Thaaliola Scroll View)
                    if (_hasResult) _buildThaaliolaResultCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThaaliolaResultCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: neutral, // Parchment / Palm leaf color
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFC8B28B), width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              '👑 KING MAVELI\'S DECREE 👑',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Color(0xFF7A4A00),
                fontFamily: "NotoSerif",
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFC8B28B), thickness: 1),
          const SizedBox(height: 12),

          _buildAstroSection(
            title: 'Purva Kaalam (Past)',
            icon: Icons.history_edu,
            content:
                'You were born under an auspicious star of generous spirit. Your past shows a strong connection to family feasts and community harmony.',
          ),
          const SizedBox(height: 16),
          _buildAstroSection(
            title: 'Varthamaanom (Present)',
            icon: Icons.wb_sunny_outlined,
            content:
                'The current season brings abundant opportunities for growth. Share your blessings, enjoy good Sadya, and focus on peace in your domain.',
          ),
          const SizedBox(height: 16),
          _buildAstroSection(
            title: 'Bhavishyath (Future)',
            icon: Icons.stars_outlined,
            content:
                'Great prosperity lies ahead. Prosperity will flourish in your household as long as truthfulness and joy guide your path.',
          ),
        ],
      ),
    );
  }

  Widget _buildAstroSection({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: const Color(0xFF7A4A00)),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5C3800),
                fontFamily: "NotoSerif",
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          content,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF3E2723),
            height: 1.4,
            fontFamily: "Vietnam",
          ),
        ),
      ],
    );
  }
}
