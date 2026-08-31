import 'package:flutter/material.dart';
import 'package:maveli_mart/utils/colors.dart';

class PathalamCheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final int deliveryFee;

  const PathalamCheckoutScreen({
    super.key,
    required this.cartItems,
    this.deliveryFee = 100,
  });

  static const primaryGreen = Color(0xFF228B22);
  static const cardBg = Color(0xFFFDF5E6);
  static const borderTone = Color(0xFFEFE6D5);

  int get itemsTotal {
    return cartItems.fold(0, (sum, item) {
      final int price = item['price'] as int;
      final int qty = item['qty'] as int;
      return sum + (price * qty);
    });
  }

  int get grandTotal => itemsTotal + (cartItems.isNotEmpty ? deliveryFee : 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: primaryGreen,
            fontWeight: FontWeight.w600,
            fontFamily: 'NotoSerif',
            fontSize: 24,
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
                        // DYNAMIC ORDER SUMMARY
                        const Text(
                          'Order Summary',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                            fontFamily: 'Vietnam',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: borderTone, width: 1.5),
                          ),
                          child: cartItems.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Center(
                                    child: Text(
                                      'Your cart is empty',
                                      style: TextStyle(
                                        color: labelColor,
                                        fontFamily: 'Vietnam',
                                      ),
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: cartItems.length,
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        height: 20,
                                        color: borderTone,
                                      ),
                                  itemBuilder: (context, index) {
                                    final item = cartItems[index];
                                    final int itemTotalPrice =
                                        (item['price'] as int) *
                                        (item['qty'] as int);
                                    return _buildCartItemRow(
                                      badgeEmoji: item['emoji'] ?? '📦',
                                      title: item['title'],
                                      qty: item['qty'],
                                      price: itemTotalPrice,
                                    );
                                  },
                                ),
                        ),

                        const SizedBox(height: 20),

                        // DELIVERY ADDRESS CARD
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Delivery Address',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: primaryGreen,
                                fontFamily: 'Vietnam',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                  fontFamily: 'Vietnam',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderTone, width: 1.5),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: primaryGreen,
                                size: 22,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Mythical Gateway, Kochi',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Vietnam',
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '(via Tripunithura)',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: labelColor,
                                        fontFamily: 'Vietnam',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // DYNAMIC PRICE DETAILS CARD
                        const Text(
                          'Price Details',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                            fontFamily: 'Vietnam',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: borderTone, width: 1.5),
                          ),
                          child: Column(
                            children: [
                              _buildPriceRow('Items Total', '₹$itemsTotal'),
                              const SizedBox(height: 10),
                              _buildPriceRow(
                                'Mythical Delivery Fee',
                                cartItems.isNotEmpty ? '₹$deliveryFee' : '₹0',
                              ),
                              const Divider(height: 24, color: borderTone),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: primaryGreen,
                                      fontFamily: 'Vietnam',
                                    ),
                                  ),
                                  Text(
                                    '₹$grandTotal',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: primaryGreen,
                                      fontFamily: 'Vietnam',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // CHARITY BANNER
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF0DD),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Text('🧡', style: TextStyle(fontSize: 14)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  '₹${cartItems.isNotEmpty ? deliveryFee : 0} from this order will be donated directly to CMDRF',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
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
                ),

                // BOOK ACTION BAR
                Container(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: cartItems.isEmpty
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
                                          Icons.local_shipping_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Pathalam Express Order for ₹$grandTotal Placed!',
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
                        backgroundColor: primaryGreen,
                        disabledBackgroundColor: Colors.grey.shade400,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Book Pathalam Express',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Vietnam',
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.rocket_launch,
                            size: 18,
                            color: Colors.white,
                          ),
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

  Widget _buildCartItemRow({
    required String badgeEmoji,
    required String title,
    required int qty,
    required int price,
  }) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: neutral,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(badgeEmoji, style: const TextStyle(fontSize: 20)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vietnam',
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Qty: $qty',
                style: const TextStyle(
                  fontSize: 12,
                  color: labelColor,
                  fontFamily: 'Vietnam',
                ),
              ),
            ],
          ),
        ),
        Text(
          '₹$price',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Vietnam',
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: labelColor,
            fontFamily: 'Vietnam',
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'Vietnam',
          ),
        ),
      ],
    );
  }
}
