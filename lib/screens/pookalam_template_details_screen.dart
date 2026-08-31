import 'package:flutter/material.dart';
import 'package:maveli_mart/data/models/flower_list_response.dart';
import 'package:maveli_mart/screens/pookalam_cart_screen.dart';
import 'package:maveli_mart/utils/colors.dart';

class PookalamTemplateDetailScreen extends StatelessWidget {
  final Map<String, dynamic> template;
  final List<dynamic> flowers;

  const PookalamTemplateDetailScreen({
    super.key,
    required this.template,
    required this.flowers,
  });

  // Helper method to compute dynamic kit breakdown from API data
  List<Map<String, dynamic>> _generateKitData() {
    final int layerCount = template['layer_count'] ?? template['layers'] ?? 3;
    final List<Map<String, dynamic>> kit = [];

    for (int layer = 1; layer <= layerCount; layer++) {
      // Filter flowers matching recommended_layer from API
      final matching = flowers.where((f) {
        final recLayer = f['recommended_layer'];
        return recLayer == layer ||
            (recLayer is List && recLayer.contains(layer));
      }).toList();

      String flowerNames;
      Color dotColor;
      int weightGram;

      if (matching.isNotEmpty) {
        flowerNames = matching
            .map((f) {
              final String name = f['name'] ?? 'Flower';
              final colors = f['colors'];
              final colorStr = (colors is List && colors.isNotEmpty)
                  ? ' (${colors[0]})'
                  : '';
              return '$name$colorStr';
            })
            .join(' & ');

        // Pick color dot from first matching item or fallback
        dotColor = _getFlowerColor(matching.first);
      } else {
        // Fallback mapping if API has fewer layers than template demands
        flowerNames = layer == 1 ? 'Thumba (White)' : 'Jamanthi (Yellow)';
        dotColor = layer == 1 ? Colors.amber.shade100 : Colors.amber;
      }

      // Estimate weight scale based on radial layer position
      weightGram = 100 * layer;

      kit.add({
        'layerName': layer == 1 ? 'Layer 1 (Center)' : 'Layer $layer',
        'flowersText': flowerNames,
        'weightText': matching.length > 1
            ? '${weightGram}g each'
            : '${weightGram}g',
        'dotColor': dotColor,
        'estimatedPrice': (weightGram / 1000) * 200, // Dynamic base calculation
      });
    }

    return kit;
  }

  double _calculateTotalCost(List<Map<String, dynamic>> kitData) {
    double total = 0;
    for (var item in kitData) {
      total += (item['estimatedPrice'] as double);
    }
    return total > 0 ? total : 650.0; // Fallback estimate
  }

  Color _getFlowerColor(Map<String, dynamic> flower) {
    final colors = flower['colors'];
    if (colors is List && colors.isNotEmpty) {
      final c = colors[0].toString().toLowerCase();
      if (c.contains('white')) return Colors.amber.shade50;
      if (c.contains('red')) return Colors.red.shade700;
      if (c.contains('yellow')) return Colors.amber.shade600;
      if (c.contains('orange')) return Colors.deepOrange;
      if (c.contains('purple') || c.contains('violet')) return Colors.purple;
    }
    return Colors.orangeAccent;
  }

  @override
  Widget build(BuildContext context) {
    final kitData = _generateKitData();
    final totalCost = _calculateTotalCost(kitData);
    final String templateName = template['name'] ?? 'Pookalam Design';
    final String geometry =
        template['geometry'] ?? 'Concentric rings with floral geometry';
    final int layers = template['layer_count'] ?? template['layers'] ?? 5;
    final String diameter = '${template['recommended_diameter_cm'] ?? 150} cm';
    final String difficulty = (template['difficulty'] ?? 'Medium').toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Details',
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
            maxWidth: 700, // Matches your web body max-width
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 140,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Template Geometry Preview Container
                      Container(
                        width: double.infinity,
                        height: 240,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2EFE4),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                  _getTemplateImage(templateName),
                                ),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) {},
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   width: 170,
                      //   height: 170,
                      //   child: ,

                      // decoration: const BoxDecoration(
                      //  color: primaryColor,
                      //   shape: BoxShape.circle,
                      // ),
                      // child: Stack(
                      //   alignment: Alignment.center,
                      //   children: [
                      //     Icon(
                      //       Icons.stars_rounded,
                      //       size: 120,
                      //       color: tertiaryColor,
                      //     ),
                      //     Icon(
                      //       Icons.shield_outlined,
                      //       size: 70,
                      //       color: const Color(0xFFF9F6EE),
                      //     ),
                      //     const CircleAvatar(
                      //       radius: 12,
                      //       backgroundColor: Colors.white,
                      //     ),
                      //   ],
                      // ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 20),

                      // 2. Title & Geometry Subtitle
                      Text(
                        templateName,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontFamily: "NotoSerif",
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        geometry,
                        style: TextStyle(
                          fontSize: 14,
                          color: labelColor,
                          height: 1.3,
                          fontFamily: "Vietnam",
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 3. Metadata Pill Badges
                      Row(
                        children: [
                          _buildBadge(Icons.layers_outlined, '$layers Layers'),
                          const SizedBox(width: 10),
                          _buildBadge(Icons.straighten_outlined, diameter),
                          const SizedBox(width: 10),
                          _buildBadge(
                            Icons.workspace_premium_outlined,
                            difficulty[0].toUpperCase() +
                                difficulty.substring(1),
                            isHighlight: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // 4. Required Flower Kit Section Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.local_florist,
                                  size: 20,
                                  color: tertiaryColor,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Required Flower Kit',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Kit Breakdown List
                            ...kitData.map((item) => _buildKitRow(item)),

                            const Divider(height: 24, thickness: 1),

                            // Total Cost Summary
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Estimated Cost',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Vietnam",
                                  ),
                                ),
                                Text(
                                  '₹${totalCost.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                    fontFamily: "Vietnam",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 5. Sticky Bottom Action Buttons Container
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: const Color(0xFFF9F6EE),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      // Primary Action: Add Complete Kit
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          icon: const Icon(
                            Icons.shopping_basket,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: Text(
                            'Add Complete Kit to Basket (₹${totalCost.toStringAsFixed(0)})',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSerif",
                            ),
                          ),
                          onPressed: () {
                            final List<Map<String, dynamic>>
                            bundledCartItems = kitData.map((item) {
                              // Clean up layer name to prevent double parentheses
                              final String cleanLayerName = item['layerName']
                                  .toString()
                                  .replaceAll('(Center)', 'Center');

                              final Flower layerFlower = Flower(
                                name: '$templateName - $cleanLayerName',
                                costPerKg: (item['estimatedPrice'] as double)
                                    .toInt(),
                                colors: [
                                  item['flowersText'].toString(),
                                ], // e.g. "Thumba (White)"
                              );

                              return {'flower': layerFlower, 'quantity': 1};
                            }).toList();

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PookalamCartScreen(
                                  cartItems: bundledCartItems,
                                  totalPrice: totalCost.toInt(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Metadata Badges
  Widget _buildBadge(IconData icon, String label, {bool isHighlight = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isHighlight ? const Color(0xFFFDF2E9) : const Color(0xFFEFECE1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: isHighlight ? secondaryColor : primaryColor,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isHighlight ? secondaryColor : primaryColor,
              fontFamily: "Vietnam",
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for Individual Flower Kit Rows
  Widget _buildKitRow(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item['dotColor'] as Color,
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['layerName'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: "Vietnam",
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item['flowersText'],
                  style: TextStyle(
                    fontSize: 13,
                    color: labelColor,
                    fontFamily: "Vietnam",
                  ),
                ),
              ],
            ),
          ),
          Text(
            item['weightText'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: primaryColor,
              fontFamily: "Vietnam",
            ),
          ),
        ],
      ),
    );
  }

  String _getTemplateImage(String? name) {
    const imageMap = {
      'Thrikkakara Star': 'assets/images/star_template.png',
      'Concentric Harmony': 'assets/images/harmony_template.png',
      'Lotus Spiral': 'assets/images/spiral_template.png',
    };
    return imageMap[name] ?? 'assets/images/default_flower.png';
  }
}
