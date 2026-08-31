import 'package:flutter/material.dart';
import 'package:maveli_mart/screens/maveli_gram_screen.dart';
import 'package:maveli_mart/screens/royal_chat_screen.dart';
import 'package:maveli_mart/utils/colors.dart';

class PrajaHubScreen extends StatelessWidget {
  const PrajaHubScreen({super.key});

  static const cardBorderColor = Color(0xFFEFE6D5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700, // Caps maximum snackbar width for web screens
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildActionCard(
                        icon: Icons.call,
                        iconBgColor: primaryColor,
                        title: 'Call\nMaveli',
                        onTap: () => showLinesBusyToast(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildActionCard(
                        icon: Icons.chat_bubble,
                        iconBgColor: secondaryColor,
                        title: 'Royal\nChat',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoyalChatScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                      const SizedBox(width: 12),
                    Expanded(
                      child: _buildActionCard(
                        icon: Icons.camera,
                        iconBgColor: tertiaryColor,
                        title: 'Maveli\ngram',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MaveligramScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 3. Praja Prashnangal Card
                _buildPrajaPrashnangalCard(context),
                const SizedBox(height: 20),

                // 4. Recent Royal Decrees Section
                Row(
                  children: [
                    //Icon(Icons.shield_outlined, color: Color(0xFFD4A017), size: 20),
                    Image.asset(
                      'assets/images/royalIcon.png',
                      width: 20,
                      height: 20,
                      color: const Color(0xFFD4A017),
                    ),

                    SizedBox(width: 8),
                    Text(
                      'Recent Royal Decrees',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "NotoSerif",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                _buildDecreeCard(
                  icon: Icons.laptop_mac_rounded,
                  iconBgColor: const Color(0xFFE8EAF6),
                  iconColor: const Color(0xFF3F51B5),
                  title: 'Royal Exemption',
                  timeAgo: '15m ago',
                  description:
                      'Mandatory half-day leave declared for all remote techies so they can crush Pappadams into Payasam without attending Zoom calls.',
                ),
                const SizedBox(height: 12),

                _buildDecreeCard(
                  icon: Icons.alt_route_rounded,
                  iconBgColor: const Color(0xFFFFF3E0),
                  iconColor: const Color(0xFFE65100),
                  title: 'Public Advisory',
                  timeAgo: '45m ago',
                  description:
                      'Royal chariot rerouted via State Highway to avoid NH 66 construction. Citizens are advised to keep extra Sharkara Upperi handy for traffic jams.',
                ),
                const SizedBox(height: 12),

                _buildDecreeCard(
                  icon: Icons.gavel_rounded,
                  iconBgColor: const Color(0xFFFFEBEE),
                  iconColor: const Color(0xFFC62828),
                  title: 'Cultural Mandate',
                  timeAgo: '2h ago',
                  description:
                      'Crushing Pappadam on top of Payasam is now officially declared a non-bailable offense across all 14 districts. Eat them separately as intended by tradition.',
                ),
                const SizedBox(height: 12),

                _buildDecreeCard(
                  icon: Icons.flight_takeoff_rounded,
                  iconBgColor: const Color(0xFFE0F7FA),
                  iconColor: const Color(0xFF00838F),
                  title: 'Global Decree',
                  timeAgo: '3h ago',
                  description:
                      'Virtual Onam blessings extended to all Pravasi Malayalis in the Gulf. Royal decree permits ordering Sadya via food delivery apps without guilt from parents back home.',
                ),
                const SizedBox(height: 12),

                _buildDecreeCard(
                  icon: Icons.wb_sunny_rounded,
                  iconBgColor: const Color(0xFFFFFDE7),
                  iconColor: const Color(0xFFF57F17),
                  title: 'Meteorological Blessing',
                  timeAgo: '5h ago',
                  description:
                      'Rain god Varuna instructed to pause sudden monsoon showers between 9 AM and 1 PM to preserve the structural integrity of outdoor Pookalams.',
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 2. Action Card Helper (Call & Chat)
  Widget _buildActionCard({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cardBorderColor),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: iconBgColor,
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: labelColor,
                height: 1.2,
                fontFamily: 'Vietnam',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 3. Praja Prashnangal Box
  Widget _buildPrajaPrashnangalCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xFFEFE7D8),
                      child: const Icon(
                        Icons.maps_ugc_outlined,
                        color: Color(0xFF8B5A2B),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Praja Prashnangal',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: "NotoSerif",
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Tell King Mahabali your problem before he leaves for Patalam.',
                            style: TextStyle(
                              fontSize: 14,
                              color: labelColor,
                              height: 1.3,
                              fontFamily: "Vietnam",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Status Callout Box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAF4E8),
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(
                      left: BorderSide(color: Color(0xFFC88A00), width: 4),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.traffic_outlined,
                        color: secondaryColor,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Maveli is currently stuck in Vytila junction traffic. Expect replies in approx 5 mins.",
                          style: TextStyle(
                            fontSize: 11,
                            fontStyle: FontStyle.italic,
                            color: labelColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => showSubmitWishBottomSheet(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    icon: const Icon(
                      Icons.send_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                    label: const Text(
                      'Submit a Request / Wish',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Vietnam",
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

  // 4. Decree Card Helper
  Widget _buildDecreeCard({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String timeAgo,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconBgColor,
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: iconColor,
                        fontFamily: "Vietnam",
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
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
    );
  }

  void showLinesBusyToast(BuildContext context) {
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
              const Icon(Icons.phone_disabled, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                'Lines are busy! Maveli is currently on another call.',
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

  void showSubmitWishBottomSheet(BuildContext context) {
    final TextEditingController wishController = TextEditingController();
    String selectedCategory = 'Sadya Crisis';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFBF0),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Handle Bar
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Header
                    const Row(
                      children: [
                        Icon(Icons.auto_awesome, color: Color(0xFFD4A017)),
                        SizedBox(width: 8),
                        Text(
                          'Praja Prashnangal & Wishes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: "NotoSerif",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Submit your issue or wish directly to Maveli before he leaves for Patalam.',
                      style: TextStyle(
                        fontSize: 12,
                        color: labelColor,
                        fontFamily: "Vietnam",
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Category Selector
                    const Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontFamily: "Vietnam",
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children:
                          [
                            'Sadya Crisis',
                            'Traffic & Work',
                            'Royal Wish',
                            'General Issue',
                          ].map((category) {
                            final isSelected = selectedCategory == category;
                            return ChoiceChip(
                              label: Text(category),
                              selected: isSelected,
                              selectedColor: primaryColor,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : labelColor,
                                fontSize: 12,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                              backgroundColor: Colors.white,
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() => selectedCategory = category);
                                }
                              },
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: 16),

                    // Message Input Field
                    TextField(
                      controller: wishController,
                      maxLines: 4,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Vietnam",
                      ),
                      decoration: InputDecoration(
                        hintText:
                            'e.g., Dear Maveli, please decree an extra holiday for Onam...',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFEFE6D5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFEFE6D5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF0F7A26),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (wishController.text.trim().isNotEmpty) {
                            Navigator.pop(context);
                            _showSuccessConfirmation(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Send to Maveli 📜',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "NotoSerif",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Success Dialog
  void _showSuccessConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: const Color(0xFFFFFBF0),
        title: const Row(
          children: [
            Text(
              "Message Delivered to Maveli! 👑",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: "NotoSerif",
              ),
            ),
          ],
        ),
        content: const Text(
          'King Mahabali has received your submission. May your Onam celebrations be grand and filled with joy!',
          style: TextStyle(fontSize: 13, color: labelColor),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Great!', style: TextStyle(color: primaryColor)),
          ),
        ],
      ),
    );
  }
}
