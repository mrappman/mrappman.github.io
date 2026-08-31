import 'package:flutter/material.dart';
import 'package:maveli_mart/utils/colors.dart';

// --- MODELS ---
class CustomizationCategory {
  final String id;
  final String title;
  final List<CustomizationItem> items;

  CustomizationCategory({
    required this.id,
    required this.title,
    required this.items,
  });
}

class CustomizationItem {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final String quote;

  CustomizationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.quote,
  });
}

// --- MAIN SCREEN ---
class CustomizeMaveliScreen extends StatefulWidget {
  const CustomizeMaveliScreen({super.key});

  @override
  State<CustomizeMaveliScreen> createState() => _CustomizeMaveliScreenState();
}

class _CustomizeMaveliScreenState extends State<CustomizeMaveliScreen> {
  static const primaryGreen = Color(0xFF228B22);
  static const cardBg = neutral;
  static const activeBorderGreen = Color(0xFF228B22);

  // Selected Category Index
  int _selectedCategoryIndex = 1; // Defaulting to 'Ride'

  // Selected Items State (Category ID -> Item ID)
  final Map<String, String> _selectedItems = {
    'walk': 'walk_classic',
    'ride': 'vintage_scooter',
    'chariot': 'chariot_gold',
    'boat': 'vallam_royal',
    'shades': 'aviator_gold',
  };

  // Mock Data matching your structure
  final List<CustomizationCategory> _categories = [
    // 1. OUTFIT (4 items)
    CustomizationCategory(
      id: 'outfit',
      title: 'Outfit',
      items: [
        CustomizationItem(
          id: 'kasavu_mundu',
          title: 'Classic Kasavu',
          description: 'Pure handloom white mundu with rich gold zari border.',
          imagePath: 'assets/images/outfit_kasavu.png',
          quote: '"Nothing beats the timeless grace of Kasavu!"',
        ),
        CustomizationItem(
          id: 'royal_silk',
          title: 'Royal Red Silk',
          description: 'Crimson silk dhoti with ornate golden threadwork.',
          imagePath: 'assets/images/outfit_silk.png',
          quote: '"Dressed in grand silk for a grand festival!"',
        ),
        CustomizationItem(
          id: 'casual_jubba',
          title: 'Festive Jubba',
          description: 'Bright yellow cotton kurta for a cozy family visit.',
          imagePath: 'assets/images/outfit_jubba.png',
          quote: '"Comfortable and ready for a heavy Sadya!"',
        ),
        CustomizationItem(
          id: 'modern_fusion',
          title: 'Onam Shirt & Mundu',
          description:
              'Trendy embroidered floral shirt paired with a golden mundu.',
          imagePath: 'assets/images/outfit_fusion.png',
          quote: '"Bringing modern flair to our age-old tradition!"',
        ),
      ],
    ),

    // 2. RIDE (4 items)
    CustomizationCategory(
      id: 'ride',
      title: 'Ride',
      items: [
        CustomizationItem(
          id: 'gajraj',
          title: 'Gajraj Elephant',
          description:
              'Caparisoned royal elephant decorated for temple processions.',
          imagePath: 'assets/images/gajraj.png',
          quote: '"Entering in grand style on my royal elephant!"',
        ),
        CustomizationItem(
          id: 'vintage_scooter',
          title: 'Vintage Scooter',
          description: 'Classic retro scooter with a cozy sidecar.',
          imagePath: 'assets/images/scooter.png',
          quote: '"Ready to roll in royal style!"',
        ),
        CustomizationItem(
          id: 'golden_chariot',
          title: 'Golden Chariot',
          description: 'Imperial horse-drawn carriage adorned with gold.',
          imagePath: 'assets/images/chariot.png',
          quote: '"Majesty and royal pride in every single motion!"',
        ),
        CustomizationItem(
          id: 'royal_auto',
          title: 'Royal Auto',
          description: 'Colorfully decorated rickshaw for quick city tours.',
          imagePath: 'assets/images/auto.png',
          quote: '"Namma Maveli riding at top speed to your home!"',
        ),
      ],
    ),

    // 3. SHADES (4 items)
    CustomizationCategory(
      id: 'shades',
      title: 'Shades',
      items: [
        CustomizationItem(
          id: 'aviator_gold',
          title: 'Classic Gold Aviators',
          description: 'Traditional gold-framed teardrop sunglasses.',
          imagePath: 'assets/images/shades_gold.png',
          quote: '"Looking sharp and cool for Onam!"',
        ),
        CustomizationItem(
          id: 'retro_round',
          title: 'Retro Round',
          description: 'Bold black circular frames with a vintage vibe.',
          imagePath: 'assets/images/shades_retro.png',
          quote: '"Cool vibes only for this year\'s visit!"',
        ),
        CustomizationItem(
          id: 'futuristic_visor',
          title: 'Cyberpunk Visor',
          description: 'Glowing futuristic neon visor shade.',
          imagePath: 'assets/images/shades_cyber.png',
          quote: '"Checking your Onam prep with high-tech vision!"',
        ),
        CustomizationItem(
          id: 'pixel_shades',
          title: 'Thug Life Pixel',
          description: 'Funky 8-bit pixelated sunglasses for a playful King.',
          imagePath: 'assets/images/shades_pixel.png',
          quote: '"Deal with it—the King has arrived!"',
        ),
      ],
    ),

    // 4. ACCESSORIES (4 items)
    CustomizationCategory(
      id: 'accessories',
      title: 'Accessories',
      items: [
        CustomizationItem(
          id: 'ola_kuda',
          title: 'Ola Kuda',
          description: 'Traditional handcrafted royal palm-leaf umbrella.',
          imagePath: 'assets/images/ola_kuda.png',
          quote: '"Shading the King from the hot mid-day sun!"',
        ),
        CustomizationItem(
          id: 'gold_bling',
          title: 'Bling & Mace',
          description: 'Heavy royal choker necklace paired with a golden mace.',
          imagePath: 'assets/images/gold_bling.png',
          quote: '"All set with my royal bling and mace!"',
        ),
        CustomizationItem(
          id: 'pookkalam_crown',
          title: 'Floral Crown',
          description: 'Fresh marigold and jasmine woven head ring.',
          imagePath: 'assets/images/crown_flower.png',
          quote: '"Smelling as fresh as a morning Pookkalam!"',
        ),
        CustomizationItem(
          id: 'selfie_stick',
          title: 'Royal Selfie Stick',
          description: 'Gold-plated selfie stick to capture feast memories.',
          imagePath: 'assets/images/selfie_stick.png',
          quote: '"Say cheese! A quick picture before the Payasam!"',
        ),
      ],
    ),

    // 5. FOOTWEAR (4 items)
    CustomizationCategory(
      id: 'footwear',
      title: 'Footwear',
      items: [
        CustomizationItem(
          id: 'metiyaadi',
          title: 'Metiyaadi',
          description:
              'Traditional carved wooden sandals worn by ancient kings.',
          imagePath: 'assets/images/metiyaadi.png',
          quote: '"Stepping into your home with royal grace!"',
        ),
        CustomizationItem(
          id: 'gold_juttis',
          title: 'Gold Juttis',
          description:
              'Soft leather slippers with intricate golden embroidery.',
          imagePath: 'assets/images/gold_juttis.png',
          quote: '"Comfy and stylish steps for a grand feast!"',
        ),
        CustomizationItem(
          id: 'led_sneakers',
          title: 'Light-Up Sneakers',
          description: 'Modern sneakers with glowing green LED soles.',
          imagePath: 'assets/images/sneakers_led.png',
          quote: '"Lighting up the doorstep with every step!"',
        ),
        CustomizationItem(
          id: 'velvet_slippers',
          title: 'Royal Velvet Mojris',
          description: 'Deep royal blue velvet slippers with zardosi detail.',
          imagePath: 'assets/images/velvet_mojri.png',
          quote: '"Pure luxury for the King\'s feet!"',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentCategory = _categories[_selectedCategoryIndex];
    final selectedItemId = _selectedItems[currentCategory.id];

    // Find active quote from selected item in current category
    final activeItem = currentCategory.items.firstWhere(
      (item) => item.id == selectedItemId,
      orElse: () => currentCategory.items.first,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Customize Maveli',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1B5E20)),
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
                // ----------------------------------------------------
                // 1. MAVELI AVATAR PREVIEW & SPEECH BUBBLE
                // ----------------------------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  child: Column(
                    children: [
                      // Circular Avatar Container with soft radial glow
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.shade100.withValues(
                                    alpha: 0.5,
                                  ),
                                  blurRadius: 10,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          // Maveli Dynamic Image Placeholder
                          ClipOval(
                            child: Image.asset(
                              'assets/images/maveli02.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.scaleDown,
                              errorBuilder: (context, error, stackTrace) =>
                                  const CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Color(0xFFF1E4CE),
                                    child: Text(
                                      '👑',
                                      style: TextStyle(fontSize: 48),
                                    ),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Dynamic Speech Bubble
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          activeItem.quote,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            fontFamily: "Vietnam",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // ----------------------------------------------------
                // 2. HORIZONTAL CATEGORY PILLS (Walk, Ride, Chariot...)
                // ----------------------------------------------------
                SizedBox(
                  height: 42,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final isSelected = index == _selectedCategoryIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategoryIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? primaryGreen : Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: isSelected ? primaryGreen : Colors.black12,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _categories[index].title,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                                fontSize: 13,
                                fontFamily: "Vietnam",
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // ----------------------------------------------------
                // 3. VERTICAL UNIFIED ITEM LISTING
                // ----------------------------------------------------
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    itemCount: currentCategory.items.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = currentCategory.items[index];
                      final isSelected = item.id == selectedItemId;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedItems[currentCategory.id] = item.id;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? activeBorderGreen
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Thumbnail Image Box
                              Container(
                                width: 72,
                                height: 72,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    item.imagePath,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                              Icons.image,
                                              color: Colors.black26,
                                            ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),

                              // Text Content (Title & Description)
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: "Vietnam",
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.description,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: labelColor,
                                        height: 1.2,
                                        fontFamily: "Vietnam",
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Custom Radio Selector Indicator
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? activeBorderGreen
                                        : Colors.black38,
                                    width: 2,
                                  ),
                                  color: Colors.transparent,
                                ),
                                child: isSelected
                                    ? Center(
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: activeBorderGreen,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ----------------------------------------------------
                // 4. PRIMARY ACTION BUTTON
                // ----------------------------------------------------
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        showMaveliArrivingDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Maveli Home!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'NotoSerif',
                            ),
                          ),
                          SizedBox(width: 8),
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

  void showMaveliArrivingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFFEFE6D5), width: 1.5),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth:
                  400, // <--- Locks the maximum width for web/desktop screens
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 28.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Festive Crown Icon / Emoji Header
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1E4CE),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text('👑', style: TextStyle(fontSize: 32)),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Title
                  const Text(
                    'King Maveli is on His Way!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                      fontFamily: 'Vietnam',
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Body Message
                  const Text(
                    'You will see Maveli with your customizations soon. Keep waiting—the King is arriving!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: labelColor,
                      height: 1.4,
                      fontFamily: 'Vietnam',
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Dismiss / Great Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Great!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'NotoSerif',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
