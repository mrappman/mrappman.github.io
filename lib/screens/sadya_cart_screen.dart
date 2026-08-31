import 'package:flutter/material.dart';
import 'package:maveli_mart/data/models/sadya_list_response.dart';
import 'package:maveli_mart/utils/colors.dart';

class CartScreen extends StatefulWidget {
  final List<SadyaListResponseModel> selectedDishes;

  const CartScreen({super.key, required this.selectedDishes});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<SadyaListResponseModel> _cartItems;

  // Recommendation Items List
  final List<Map<String, dynamic>> _recommendedItems = [
    {
      'id': 'leaf_1',
      'name': 'Fresh Banana Leaf',
      'price': 15,
      'image': 'assets/images/leaf.png',
    },
    {
      'id': 'chips_1',
      'name': 'Banana Chips',
      'price': 45,
      'image': 'assets/images/chips.png',
    },
    {
      'id': 'sarkara_1',
      'name': 'Sarkara Varatti',
      'price': 55,
      'image': 'assets/images/sweet.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _cartItems = List.from(widget.selectedDishes);
  }

  int get totalAmount =>
      _cartItems.fold(0, (sum, item) => sum + (item.cost ?? 0));

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  void _addRecommendedToCart(Map<String, dynamic> recItem) {
    setState(() {
      _cartItems.add(
        SadyaListResponseModel(
          id: recItem['id'],
          name: recItem['name'],
          cost: recItem['price'],
          description: 'Popular Sadya Side Add-on',
        ),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${recItem['name']} added to your Sadya!'),
        duration: const Duration(seconds: 1),
        backgroundColor: primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Sadya',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context, _cartItems),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700, // Matches your web body max-width
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // =========================================================
                    // BANANA LEAF CARD
                    // =========================================================
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFEFE6D5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.02),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your Banana Leaf',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: "Vietnam",
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(color: Color(0xFFE0E0E0), height: 1),
                          const SizedBox(height: 8),
            
                          _cartItems.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 24.0),
                                  child: Center(
                                    child: Text(
                                      'Your banana leaf is empty!',
                                      style: TextStyle(
                                        color: labelColor,
                                        fontFamily: "Vietnam",
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _cartItems.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 12),
                                  itemBuilder: (context, index) {
                                    final item = _cartItems[index];
                                    return Row(
                                      children: [
                                        const Icon(
                                          Icons.flatware,
                                          size: 18,
                                          color: Color(0xFF8B5A2B),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            item.name ?? 'Unknown Dish',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: labelColor,
                                              fontFamily: "Vietnam",
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '₹${item.cost ?? 0}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                            fontFamily: "Vietnam",
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.delete_outline,
                                            color: Color(0xFFD32F2F),
                                            size: 20,
                                          ),
                                          onPressed: () => _removeItem(index),
                                          constraints: const BoxConstraints(),
                                          padding: const EdgeInsets.only(left: 8),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
            
                    const SizedBox(height: 24),
            
                    // =========================================================
                    // RECOMMENDATIONS SECTION
                    // =========================================================
                    const Text(
                      'Complete Your Sadya',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontFamily: "NotoSerif",
                      ),
                    ),
                    const SizedBox(height: 12),
            
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _recommendedItems.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final rec = _recommendedItems[index];
                          return _buildRecommendationCard(rec);
                        },
                      ),
                    ),
            
                    const SizedBox(height: 24),
            
                    // =========================================================
                    // ORDER SUMMARY CARD
                    // =========================================================
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBF3),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFEFE6D5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order Summary',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: "NotoSerif",
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Dishes',
                                style: TextStyle(
                                  color: labelColor,
                                  fontSize: 13,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                              Text(
                                '${_cartItems.length} dishes',
                                style: const TextStyle(
                                  color: labelColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Divider(color: Color(0xFFE0E0E0), height: 1),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Amount',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                              Text(
                                '₹$totalAmount',
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            
                    const SizedBox(height: 20),
            
                    // =========================================================
                    // ORDER BUTTON
                    // =========================================================
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _cartItems.isEmpty
                            ? null
                            : () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor:
                                        primaryColor, // Make sure primaryColor is available in scope
                                    content: SafeArea(
                                      child: Row(
                                        mainAxisSize: MainAxisSize
                                            .min, // Compact horizontally
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Center contents within the row
                                        children: [
                                          const Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Sadya Order Placed for ₹$totalAmount! 🍛',
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
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          disabledBackgroundColor: Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                        ),
                        icon: const Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Order Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: "NotoSerif",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Recommendation Card Builder
  Widget _buildRecommendationCard(Map<String, dynamic> item) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Portion
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              item['image'],
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 100,
                color: const Color(0xFFF3EBDD),
                child: const Icon(Icons.restaurant, color: primaryColor),
              ),
            ),
          ),

          // Card Details
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: "Vietnam",
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${item['price']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontFamily: "Vietnam",
                      ),
                    ),
                    InkWell(
                      onTap: () => _addRecommendedToCart(item),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF9800),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
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
}
