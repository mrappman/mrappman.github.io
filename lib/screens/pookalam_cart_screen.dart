import 'package:flutter/material.dart';
import 'package:maveli_mart/data/models/flower_list_response.dart';
import 'package:maveli_mart/utils/colors.dart';

class PookalamCartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final int totalPrice;

  const PookalamCartScreen({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  State<PookalamCartScreen> createState() => _PookalamCartScreenState();
}

class _PookalamCartScreenState extends State<PookalamCartScreen> {
  late List<Map<String, dynamic>> _items;
  static const int _deliveryFee = 40;

  @override
  void initState() {
    super.initState();
    // Create a mutable copy of the passed cart items
    _items = List<Map<String, dynamic>>.from(
      widget.cartItems.map((item) => Map<String, dynamic>.from(item)),
    );
  }

  int get _itemTotal {
    int total = 0;
    for (var item in _items) {
      final flower = item['flower'] as Flower?;
      final quantity = item['quantity'] as int? ?? 0;
      final price = flower?.costPerKg ?? 0;
      total += price * quantity;
    }
    return total;
  }

  int get _grandTotal => _items.isEmpty ? 0 : _itemTotal + _deliveryFee;

  void _updateQuantity(int index, int delta) {
    setState(() {
      final currentQty = _items[index]['quantity'] as int? ?? 0;
      final newQty = currentQty + delta;

      if (newQty <= 0) {
        _items.removeAt(index);
      } else {
        _items[index]['quantity'] = newQty;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context, _items),
        ),
        centerTitle: true,
        title: const Text(
          'Pookalam Cart',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
      ),
      body: _items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 64,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Vietnam",
                      color: labelColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, _items),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: const Text(
                      'Browse Flowers',
                      style: TextStyle(
                        fontFamily: "Vietnam",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700, // Caps maximum snackbar width for web screens
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _items.length,
                            itemBuilder: (context, index) {
                              final item = _items[index];
                              final flower = item['flower'] as Flower?;
                              final quantity = item['quantity'] as int? ?? 1;

                              return _buildCartTile(
                                flower: flower,
                                quantity: quantity,
                                onIncrement: () => _updateQuantity(index, 1),
                                onDecrement: () => _updateQuantity(index, -1),
                                onRemove: () => _removeItem(index),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFBF3),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFEFE6D5),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Order Summary',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                    fontFamily: "NotoSerif",
                                  ),
                                ),
                                const SizedBox(height: 12),
                                _buildSummaryRow('Item Total', '₹$_itemTotal'),
                                const SizedBox(height: 6),
                                _buildSummaryRow(
                                  'Delivery Fee',
                                  '₹$_deliveryFee',
                                ),
                                const Divider(
                                  height: 24,
                                  color: Color(0xFFEFE6D5),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Grand Total',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Vietnam",
                                      ),
                                    ),
                                    Text(
                                      '₹$_grandTotal',
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
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
                                        Icons.local_shipping_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Order Placed! Fresh flowers scheduled for morning delivery.',
                                        style: const TextStyle(
                                          fontFamily: "Vietnam",
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
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
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Proceed to Checkout (₹$_grandTotal)',
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

  Widget _buildCartTile({
    required Flower? flower,
    required int quantity,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
    required VoidCallback onRemove,
  }) {
    final name = flower?.name ?? 'Unknown Flower';
    final pricePerKg = flower?.costPerKg ?? 0;
    final itemTotal = pricePerKg * quantity;
    final colorsStr = (flower?.colors != null && flower!.colors!.isNotEmpty)
        ? flower.colors!.join(', ')
        : 'Fresh';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFFAF7EE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  8.0,
                ), // Adjust the radius degree here
                child: Image.asset(
                  _getFlowerImage(flower?.name),
                  width: 30,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    width: double.infinity,
                    color: const Color(0xFFF3EBDD),
                    child: const Icon(Icons.eco, color: primaryColor),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Vietnam",
                  ),
                ),
                Text(
                  '${quantity}kg • $colorsStr',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontFamily: "Vietnam",
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '₹$itemTotal (₹$pricePerKg/kg)',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontFamily: "Vietnam",
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: neutral,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 28),
                      icon: const Icon(Icons.remove, size: 14),
                      onPressed: onDecrement,
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 28),
                      icon: const Icon(Icons.add, size: 14),
                      onPressed: onIncrement,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                  size: 20,
                ),
                onPressed: onRemove,
              ),
            ],
          ),
        ],
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

    return imageMap[name] ?? 'assets/images/default_flower.png';
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontFamily: "Vietnam",
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: "Vietnam",
          ),
        ),
      ],
    );
  }
}
