import 'package:flutter/material.dart';
import 'package:maveli_mart/utils/colors.dart';

class PathalamBuildersScreen extends StatefulWidget {
  const PathalamBuildersScreen({super.key});

  @override
  State<PathalamBuildersScreen> createState() => _PathalamBuildersScreenState();
}

class _PathalamBuildersScreenState extends State<PathalamBuildersScreen> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF228B22);
    const neutral = Color(0xFFFDF5E6);
    const borderColor = Color(0xFFEFE6D5);

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
          'Pathalam Builders',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
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
                // 1. Pass Eligibility Status Banner
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: neutral,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderColor),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.verified_user,
                        color: primaryColor,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '1-Year Royal Pass Active',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontFamily: "Vietnam",
                              ),
                            ),
                            Text(
                              'You are eligible to buy & settle in Pathalam',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black54,
                                fontFamily: "Vietnam",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // 2. Minimal Category Filter
                SizedBox(
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: ['All', 'Plots', 'Villas', 'Palaces'].map((
                      category,
                    ) {
                      final isSelected = _selectedCategory == category;
                      return GestureDetector(
                        onTap: () =>
                            setState(() => _selectedCategory = category),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? primaryColor : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: isSelected ? primaryColor : borderColor,
                            ),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black87,
                              fontFamily: "Vietnam",
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 16),

                // 3. Property List View
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildPropertyCard(
                        title: 'Golden Pookalam Villa',
                        location: 'Pathalam Enclave',
                        price: '₹45 Lakhs / 100 Sovereign',
                        specs: '3 BHK • 15 Cents • Eternal Garden',
                        image: "assets/images/golden_plot.png",
                      ),
                      _buildPropertyCard(
                        title: 'Asura Eco Plot',
                        location: 'Maveli Heights',
                        price: '₹12 Lakhs / Plot',
                        specs: '10 Cents • Road Access • Pookalam Ready',
                        image: "assets/images/aura_plot.png",
                      ),
                      _buildPropertyCard(
                        title: 'Royal Mahabali Palace Wing',
                        location: 'Pathalam Central',
                        price: '₹1.2 Crore',
                        specs: '5 BHK • Private Court • Royal Guard Access',
                        image: "assets/images/palace_plot.png",
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

  Widget _buildPropertyCard({
    required String title,
    required String location,
    required String price,
    required String specs,
    required String image,
  }) {
    const primaryColor = Color(0xFF228B22);
    const borderColor = Color(0xFFEFE6D5);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image / Render Placeholder
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFFAF7EE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Vietnam",
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontFamily: "Vietnam",
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            location,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
              fontFamily: "Vietnam",
            ),
          ),
          const SizedBox(height: 6),
          Text(
            specs,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: "Vietnam",
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              onPressed: () {
                showToast(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Express Interest / Book Site Visit',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Vietnam",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showToast(BuildContext context) {
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
                'Interest logged! The Royal Steward will contact you.',
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
