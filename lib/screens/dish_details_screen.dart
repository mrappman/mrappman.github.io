import 'package:flutter/material.dart';
import 'package:maveli_mart/data/models/sadya_list_response.dart';
import 'package:maveli_mart/utils/colors.dart';

class DishDetailScreen extends StatelessWidget {
  final SadyaListResponseModel dish;

  const DishDetailScreen({super.key, required this.dish});

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
        child: Container(
          constraints: const BoxConstraints(
          maxWidth: 700, // Maximum width for web screens
        ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =========================================================
                // HERO IMAGE CARD
                // =========================================================
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(_getDishImage(dish.id)),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {},
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.1),
                          Colors.black.withValues(alpha: 0.85),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dish.name ?? 'Dish Name',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: "NotoSerif",
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          dish.description ?? '',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 13,
                            height: 1.4,
                            fontFamily: "Vietnam",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          
                const SizedBox(height: 16),
          
                // =========================================================
                // METRICS ROW (PREP TIME, CALORIES, SPICINESS)
                // =========================================================
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFEFE6D5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMetricItem(
                        icon: Icons.access_time,
                        iconColor: const Color(0xFF2E7D32),
                        value: '${dish.prepTimeMin ?? 0} min',
                        label: 'Prep Time',
                      ),
                      _buildDivider(),
                      _buildMetricItem(
                        icon: Icons.local_fire_department_outlined,
                        iconColor: const Color(0xFFE65100),
                        value: '${dish.calories ?? 0} kcal',
                        label: 'Calories',
                      ),
                      _buildDivider(),
                      _buildMetricItem(
                        icon: Icons.published_with_changes_rounded,
                        iconColor: const Color(0xFFF57C00),
                        value: (dish.spiciness ?? 'None').capitalize(),
                        label: 'Spiciness',
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 16),
          
                // =========================================================
                // TAGS CHIPS
                // =========================================================
                if (dish.tags != null && dish.tags!.isNotEmpty) ...[
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: dish.tags!.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFE6D5).withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE3D3B8)),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Color(0xFF4E342E),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Vietnam",
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                ],
          
                // =========================================================
                // FLAVOR PROFILE & ALLERGENS CARD
                // =========================================================
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFEFE6D5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Flavor Profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B4D2E),
                          fontFamily: "NotoSerif",
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Divider(color: Color(0xFFEFE6D5)),
                      const SizedBox(height: 12),
          
                      // Flavor Grid 2x2
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 2.8,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: [
                          _buildFlavorTile(
                            label: 'Salty',
                            score: dish.flavors?.salty ?? 0,
                            activeColor: Colors.orange,
                          ),
                          _buildFlavorTile(
                            label: 'Sweet',
                            score: dish.flavors?.sweet ?? 0,
                            activeColor: Colors.amber,
                          ),
                          _buildFlavorTile(
                            label: 'Spicy',
                            score: dish.flavors?.spicy ?? 0,
                            activeColor: Colors.redAccent,
                          ),
                          _buildFlavorTile(
                            label: 'Sour',
                            score: dish.flavors?.sour ?? 0,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
          
                      if (dish.allergens != null && dish.allergens!.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(
                              Icons.info_outline,
                              size: 16,
                              color: Color(0xFFC62828),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                'Contains Allergens: ${dish.allergens!.join(', ')}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFC62828),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
          
                const SizedBox(height: 20),
          
                // =========================================================
                // THE FAMILY DEBATE SECTION
                // =========================================================
                if (dish.debateComments != null) ...[
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: neutral,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              color: Color(0xFF8D4B08),
                              size: 22,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'The Family Debate',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8D4B08),
                                fontFamily: "NotoSerif",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
          
                        if (dish.debateComments?.grandma != null)
                          _buildDebateCard(
                            icon: Icons.face_3_outlined,
                            title: 'Grandma',
                            quote: dish.debateComments!.grandma!,
                            accentColor: const Color(0xFF1B4D2E),
                          ),
                        if (dish.debateComments?.kid != null) ...[
                          const SizedBox(height: 12),
                          _buildDebateCard(
                            icon: Icons.sentiment_satisfied_alt_outlined,
                            title: 'Kid',
                            quote: dish.debateComments!.kid!,
                            accentColor: const Color(0xFFD84315),
                          ),
                        ],
                        if (dish.debateComments?.healthFreak != null) ...[
                          const SizedBox(height: 12),
                          _buildDebateCard(
                            icon: Icons.fitness_center_outlined,
                            title: 'Health Freak',
                            quote: dish.debateComments!.healthFreak!,
                            accentColor: const Color(0xFF455A64),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
          
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildMetricItem({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
            fontFamily: "Vietnam",
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
            fontFamily: "Vietnam",
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: const Color(0xFFEFE6D5),
    );
  }

  Widget _buildFlavorTile({
    required String label,
    required int score,
    required Color activeColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF7EE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: "Vietnam",
            ),
          ),
          Row(
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.only(left: 3),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < score ? activeColor : const Color(0xFFE0E0E0),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildDebateCard({
    required IconData icon,
    required String title,
    required String quote,
    required Color accentColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(color: accentColor, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: accentColor),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                  fontFamily: "Vietnam",
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '"$quote"',
            style: const TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Colors.black,
              height: 1.3,
              fontFamily: "Vietnam",
            ),
          ),
        ],
      ),
    );
  }
}

  String _getDishImage(String? id) {
    const imageMap = {
      'parippu': 'assets/images/parippu.png',
      'sambar': 'assets/images/sambar.png',
      'kaalan': 'assets/images/kaalan.png',
      'olan': 'assets/images/olan.png',
      'erissery': 'assets/images/erissery.png',
      'avial': 'assets/images/avial.png',
      'kootu_curry': 'assets/images/kootu.png',
      'pulissery': 'assets/images/pulissery.png',
      'thoran': 'assets/images/thoran.png',
      'inji_puli': 'assets/images/inji.png',
      'pappadam': 'assets/images/pappadam.png',
      'palada_pradhaman': 'assets/images/pallada.png',
      'ada_pradhaman': 'assets/images/ada.png',
    };

    return imageMap[id] ?? 'assets/images/default.png';
  }

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}