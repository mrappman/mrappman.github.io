import 'package:flutter/material.dart';
import 'package:maveli_mart/data/models/flower_list_response.dart';
import 'package:maveli_mart/screens/pookalam_cart_screen.dart';
import 'package:maveli_mart/utils/colors.dart';

class FlowerDetailsScreen extends StatefulWidget {
  final Flower flower;

  const FlowerDetailsScreen({super.key, required this.flower});

  @override
  State<FlowerDetailsScreen> createState() => _FlowerDetailsScreenState();
}

class _FlowerDetailsScreenState extends State<FlowerDetailsScreen> {
  String _selectedWeight = '100g';

  // Weight options and their multiplier relative to 1kg
  final Map<String, double> _weightMultipliers = {
    '100g': 0.1,
    '500g': 0.5,
    '1kg': 1.0,
  };

  int get _calculatedPrice {
    final basePrice = widget.flower.costPerKg ?? 0;
    final multiplier = _weightMultipliers[_selectedWeight] ?? 1.0;
    return (basePrice * multiplier).round();
  }

  @override
  Widget build(BuildContext context) {
    final flower = widget.flower;
    final colorsStr = (flower.colors != null && flower.colors!.isNotEmpty)
        ? flower.colors!.join(', ')
        : 'Vibrant';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Details',
          style: const TextStyle(
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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: _buildImagePlaceholder(flower.name ?? ""),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            flower.name ?? 'Flower',
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontFamily: "NotoSerif",
                            ),
                          ),
                          Text(
                            '₹$_calculatedPrice',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                              fontFamily: "Vietnam",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Base Rate: ₹${flower.costPerKg ?? 0} / kg',
                        style: const TextStyle(
                          fontSize: 12,
                          color: labelColor,
                          fontFamily: "Vietnam",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          _buildSpecTile(
                            'Freshness',
                            '12 Hours',
                            Icons.timer_outlined,
                          ),
                          const SizedBox(width: 12),
                          _buildSpecTile(
                            'Color Variant',
                            colorsStr,
                            Icons.palette_outlined,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFBF3),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFEFE6D5)),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.auto_awesome, size: 20, color: Colors.amber),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Symbolism: Purity & Devotion for Onam Pookalam',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Select Weight',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Vietnam",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: _weightMultipliers.keys.map((weight) {
                          final isSelected = _selectedWeight == weight;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedWeight = weight),
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: isSelected ? primaryColor : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF1B4D2E)
                                        : const Color(0xFFEFE6D5),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    weight,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Vietnam",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final cartPayload = [
                        {
                          'flower': flower,
                          'quantity':
                              (_weightMultipliers[_selectedWeight]! * 1).toInt() > 0
                              ? (_weightMultipliers[_selectedWeight]! * 1).toInt()
                              : 1,
                          'selectedWeight': _selectedWeight,
                        },
                      ];
          
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PookalamCartScreen(
                            cartItems: cartPayload,
                            totalPrice: _calculatedPrice,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    icon: const Icon(Icons.shopping_basket, color: Colors.white),
                    label: Text(
                      'Add to Basket (₹$_calculatedPrice)',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "Vietnam",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder(String flowerName) {
    return Container(
      height: 220,
      width: double.infinity,
      color: const Color(0xFFEFE6D5),
      child: Image.asset(
        _getFlowerImage(flowerName),
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 200,
          width: double.infinity,
          color: const Color(0xFFF3EBDD),
          child: const Icon(Icons.eco, color: primaryColor),
        ),
      ),
    );
  }

  String _getFlowerImage(String? name) {
    const imageMap = {
      'Thumba': 'assets/images/thumba.png',
      'Mukkutti': 'assets/images/mukkuti.png',
      'Kakka Poovu': 'assets/images/kakkapoovu.png',
      'Chethi': 'assets/images/chetti.png',
      'Chembarathi': 'assets/images/chembarathi.png',
      'Jamanthi': 'assets/images/jamanthi.png',
      'Vadarkutti': 'assets/images/vadamulla.png',
    };

    return imageMap[name] ?? 'assets/images/jamanthi.png';
  }

  Widget _buildSpecTile(String title, String val, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEFE6D5)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: primaryColor),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 10,
                      color: labelColor,
                      fontFamily: "Vietnam",
                    ),
                  ),
                  Text(
                    val,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Vietnam",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
