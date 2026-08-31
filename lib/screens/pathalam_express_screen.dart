import 'package:flutter/material.dart';
import 'package:maveli_mart/utils/colors.dart';
import 'pathalam_checkout_screen.dart';

class PathalamExpressScreen extends StatefulWidget {
  const PathalamExpressScreen({super.key});

  @override
  State<PathalamExpressScreen> createState() => _PathalamExpressScreenState();
}

class _PathalamExpressScreenState extends State<PathalamExpressScreen> {
  static const primaryGreen = Color(0xFF228B22);
  static const cardBg = Color(0xFFFDF5E6);
  static const borderTone = Color(0xFFEFE6D5);

  final List<Map<String, dynamic>> _products = [
    {
      'id': 'gold_coin',
      'emoji': '🪙',
      'title': 'Pathalam Gold Coin (Aswamedha Mudra)',
      'desc': 'Mythical gold keepsake for good luck and prosperity.',
      'price': 1001,
      'image': 'assets/images/gold_coin.png',
    },
    {
      'id': 'nectar_jar',
      'emoji': '🫙',
      'title': 'Amritam Nectar Jar',
      'desc':
          'Special herbal concoction symbolizing health, longevity, and immunity.',
      'price': 499,
      'image': 'assets/images/amritam.png',
    },
    {
      'id': 'kalpavriksha',
      'emoji': '🪴',
      'title': 'Kalpavriksha Seedling',
      'desc': 'Mythical wish-granting plant seed for your home garden.',
      'price': 250,
      'image': 'assets/images/kalpa.png',
    },
    {
      'id': 'sanjivani',
      'emoji': '🌿',
      'title': 'Sanjivani Healing Herb Pack',
      'desc': 'Traditional Ayurvedic wellness mix.',
      'price': 350,
      'image': 'assets/images/sanjivani.png',
    },
    {
      'id': 'spice_blend',
      'emoji': '🌶️',
      'title': 'Pathalam Spice Blend',
      'desc':
          'Special underworld secret spice mix for extra flavorful Sadya dishes.',
      'price': 150,
      'image': 'assets/images/spice.png',
    },
  ];

  // Map of index -> quantity
  final Map<int, int> _cart = {};

  List<Map<String, dynamic>> _getSelectedCartItems() {
    List<Map<String, dynamic>> items = [];
    _cart.forEach((index, qty) {
      if (qty > 0) {
        items.add({
          'id': _products[index]['id'],
          'title': _products[index]['title'],
          'emoji': _products[index]['emoji'],
          'price': _products[index]['price'],
          'qty': qty,
        });
      }
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = _cart.values.fold(0, (sum, count) => sum + count);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pathalam Express',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
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
                      vertical: 10.0,
                    ),
                    child: Column(
                      children: [
                        // HERO BANNER
                        Container(
                          //assets/images/pathalamBg.png
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/pathalamBg.png'),
                              fit: BoxFit.cover,
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
                                  Colors.black.withValues(alpha: 0.3),
                                  Colors.black.withValues(alpha: 0.75),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'Pathalam Express - Request from the Pathalam',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'NotoSerif',
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.volunteer_activism,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          '100% of delivery fees go to Chief Minister\'s Distress Relief Fund (CMDRF)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
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

                        const SizedBox(height: 16),

                        // LIST OF ITEMS
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _products.length,
                          itemBuilder: (context, index) {
                            final item = _products[index];
                            final int qty = _cart[index] ?? 0;

                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: cardBg,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: borderTone,
                                  width: 1.5,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15),
                                    ),
                                    child: Image.asset(
                                      item['image'],
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['title'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                            fontFamily: 'Vietnam',
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item['desc'],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: labelColor,
                                            fontFamily: 'Vietnam',
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '₹${item['price']}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: primaryGreen,
                                                fontFamily: 'Vietnam',
                                              ),
                                            ),
                                            qty == 0
                                                ? ElevatedButton.icon(
                                                    onPressed: () {
                                                      setState(() {
                                                        _cart[index] = 1;
                                                      });
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          primaryGreen,
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 14,
                                                            vertical: 8,
                                                          ),
                                                    ),
                                                    icon: const Icon(
                                                      Icons.add,
                                                      size: 16,
                                                      color: Colors.white,
                                                    ),
                                                    label: const Text(
                                                      'Add',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Vietnam',
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                      color: neutral,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                      border: Border.all(
                                                        color: borderTone,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          constraints:
                                                              const BoxConstraints(
                                                                minWidth: 32,
                                                                minHeight: 32,
                                                              ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                          icon: const Icon(
                                                            Icons.remove,
                                                            size: 16,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              if (qty > 1) {
                                                                _cart[index] =
                                                                    qty - 1;
                                                              } else {
                                                                _cart.remove(
                                                                  index,
                                                                );
                                                              }
                                                            });
                                                          },
                                                        ),
                                                        Text(
                                                          '$qty',
                                                          style:
                                                              const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Vietnam',
                                                              ),
                                                        ),
                                                        IconButton(
                                                          constraints:
                                                              const BoxConstraints(
                                                                minWidth: 32,
                                                                minHeight: 32,
                                                              ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                          icon: const Icon(
                                                            Icons.add,
                                                            size: 16,
                                                            color: primaryGreen,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              _cart[index] =
                                                                  qty + 1;
                                                            });
                                                          },
                                                        ),
                                                      ],
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
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // BOOK / CHECKOUT ACTION BUTTON
                Container(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: totalItems == 0
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PathalamCheckoutScreen(
                                    cartItems: _getSelectedCartItems(),
                                  ),
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        disabledBackgroundColor: Colors.grey.shade400,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.local_shipping_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            totalItems > 0
                                ? 'Book Pathalam Express ($totalItems Items)'
                                : 'Select Items to Book',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Vietnam',
                            ),
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
}
