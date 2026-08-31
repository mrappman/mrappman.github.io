import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maveli_mart/blocs/flower_list_bloc/bloc/flower_list_bloc.dart';
import 'package:maveli_mart/data/models/flower_list_response.dart';
import 'package:maveli_mart/screens/flower_details_screen.dart';
import 'package:maveli_mart/screens/pookalam_builder_screen.dart';
import 'package:maveli_mart/screens/pookalam_cart_screen.dart';
import 'package:maveli_mart/screens/pookalam_template_details_screen.dart';
import 'package:maveli_mart/utils/colors.dart';

class PookalamStoreScreen extends StatefulWidget {
  const PookalamStoreScreen({super.key});

  @override
  State<PookalamStoreScreen> createState() => _PookalamStoreScreenState();
}

class _PookalamStoreScreenState extends State<PookalamStoreScreen> {
  // 1. Instantiated local BLoC directly like SadyaPlannerScreen
  final FlowerListBloc flowerListBloc = FlowerListBloc();

  // Cached response data state
  FlowerListResponseModel? flowerListResponse;
  final Map<String, int> _cartQuantities = {};

  @override
  void initState() {
    super.initState();
    // 2. Trigger initial event on initState
    flowerListBloc.add(GetFlowerListEvent());
  }

  @override
  void dispose() {
    // 3. Dispose local BLoC instance
    flowerListBloc.close();
    super.dispose();
  }

  int get _totalItemsSelected {
    return _cartQuantities.values.fold(0, (sum, qty) => sum + qty);
  }

  int get _totalPrice {
    if (flowerListResponse?.flowers == null) return 0;
    int total = 0;
    for (var flower in flowerListResponse!.flowers!) {
      if (flower.name != null) {
        final int price = flower.costPerKg ?? 0;
        final int qty = _cartQuantities[flower.name!] ?? 0;
        total += price * qty;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final bool hasSelection = _totalItemsSelected > 0;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700, // Caps maximum snackbar width for web screens
          ),

          child: BlocBuilder<FlowerListBloc, FlowerListState>(
            bloc: flowerListBloc,
            builder: (context, state) {
              // Loading state handling
              if (state is FlowerListLoadingState &&
                  flowerListResponse == null) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }

              // Cache API payload upon success
              if (state is FlowerListSuccessState) {
                flowerListResponse = state.successResponse;
              }

              // Error state handling
              if (state is FlowerListErrorState && flowerListResponse == null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.errorMsg,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: labelColor,
                          fontFamily: "Vietnam",
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          flowerListBloc.add(GetFlowerListEvent());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.refresh),
                        label: const Text(
                          'Retry',
                          style: TextStyle(fontFamily: "Vietnam"),
                        ),
                      ),
                    ],
                  ),
                );
              }

              final flowers = flowerListResponse?.flowers ?? [];
              final templates = flowerListResponse?.templates ?? [];

              if (flowers.isEmpty && templates.isEmpty) {
                return const Center(
                  child: Text(
                    'Flower list is empty',
                    style: TextStyle(
                      fontFamily: "Vietnam",
                      color: labelColor,
                      fontSize: 18,
                    ),
                  ),
                );
              }

              return Stack(
                children: [
                  RefreshIndicator(
                    color: primaryColor,
                    onRefresh: () async {
                      flowerListBloc.add(GetFlowerListEvent());
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //const SizedBox(height: 24),
                          const Text(
                            'Pookalam Store',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                              fontFamily: "NotoSerif",
                            ),
                          ),
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/pookalamBanner.png',
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                height: 160,
                                color: const Color(0xFFEFE6D5),
                                child: const Icon(
                                  Icons.local_florist,
                                  size: 48,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),

                          // Templates Horizontal Carousel
                          if (templates.isNotEmpty) ...[
                            const SizedBox(height: 20),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Design Templates',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "NotoSerif",
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 110,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: templates.length,
                                itemBuilder: (context, index) {
                                  final template = templates[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PookalamTemplateDetailScreen(
                                                // Convert your object to Map or pass properties accordingly
                                                template: {
                                                  'name': template.name,
                                                  'layer_count':
                                                      template.layerCount,
                                                  'recommended_diameter_cm':
                                                      template
                                                          .recommendedDiameterCm,
                                                  'difficulty':
                                                      template.difficulty,
                                                  'geometry': template.geometry,
                                                },
                                                flowers: flowers
                                                    .map((f) => f.toJson())
                                                    .toList(), // Pass your loaded API flowers list here
                                              ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 150,
                                      margin: const EdgeInsets.only(right: 12),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFAF7EE),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: const Color(0xFFEFE6D5),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            template.name ?? 'Template',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "NotoSerif",
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Layers: ${template.layerCount ?? 0}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: labelColor,
                                            ),
                                          ),
                                          Text(
                                            '${template.recommendedDiameterCm ?? 0} cm | ${template.difficulty ?? ""}',
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: labelColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],

                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Available Flowers',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "NotoSerif",
                                color: primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Flowers Grid
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.72,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                ),
                            itemCount: flowers.length,
                            itemBuilder: (context, index) {
                              final flower = flowers[index];
                              final String name = flower.name ?? 'Unknown';
                              final int qty = _cartQuantities[name] ?? 0;

                              return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: const Color(0xFFEFE6D5),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(12),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FlowerDetailsScreen(
                                                    flower: flower,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Container(
                                                  color: const Color(
                                                    0xFFFAF7EE,
                                                  ),
                                                  width: double.infinity,
                                                  child: Image.asset(
                                                    _getFlowerImage(
                                                      flower.name,
                                                    ),
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                    errorBuilder:
                                                        (
                                                          context,
                                                          error,
                                                          stackTrace,
                                                        ) => Container(
                                                          height: 200,
                                                          width:
                                                              double.infinity,
                                                          color: const Color(
                                                            0xFFF3EBDD,
                                                          ),
                                                          child: const Icon(
                                                            Icons.eco,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(height: 8),
                                            Text(
                                              name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "NotoSerif",
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              '₹${flower.costPerKg ?? 0} / kg',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: labelColor,
                                                fontFamily: "Vietnam",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: neutral,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(
                                              Icons.remove,
                                              size: 16,
                                            ),
                                            onPressed: qty > 0
                                                ? () => setState(
                                                    () =>
                                                        _cartQuantities[name] =
                                                            qty - 1,
                                                  )
                                                : null,
                                          ),
                                          Text(
                                            '$qty',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(
                                              Icons.add,
                                              size: 16,
                                            ),
                                            onPressed: () => setState(
                                              () => _cartQuantities[name] =
                                                  qty + 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),

                  // Dynamic Floating Bottom Bar
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: const Color(0xFFEFE6D5)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: hasSelection ? 2 : 3,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PookalamBuilderScreen(
                                      availableFlowers: flowers,
                                    ),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: hasSelection
                                      ? primaryColor
                                      : secondaryColor,
                                  width: 1.5,
                                ),
                                backgroundColor: hasSelection
                                    ? Colors.transparent
                                    : secondaryColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              icon: Icon(
                                Icons.palette_outlined,
                                color: hasSelection
                                    ? primaryColor
                                    : Colors.white,
                                size: 18,
                              ),
                              label: Text(
                                hasSelection ? 'Design' : 'Design My Pookalam',
                                style: TextStyle(
                                  color: hasSelection
                                      ? primaryColor
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  fontFamily: "Vietnam",
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          if (hasSelection) const SizedBox(width: 8),
                          if (hasSelection)
                            Expanded(
                              flex: 3,
                              child: ElevatedButton(
                                onPressed: () {
                                  final selectedItems = _cartQuantities.entries
                                      .where((e) => e.value > 0)
                                      .map((e) {
                                        final flower = flowers.firstWhere(
                                          (f) => f.name == e.key,
                                          orElse: () => Flower(name: e.key),
                                        );
                                        return {
                                          'flower': flower,
                                          'quantity': e.value,
                                        };
                                      })
                                      .toList();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PookalamCartScreen(
                                        cartItems: selectedItems,
                                        totalPrice: _totalPrice,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 12,
                                  ),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        '$_totalItemsSelected',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Cart (₹$_totalPrice)',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        fontFamily: "Vietnam",
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
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
}
