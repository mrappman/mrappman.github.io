import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maveli_mart/blocs/sadya_list_bloc/bloc/sadya_list_bloc.dart';
import 'package:maveli_mart/data/models/sadya_list_response.dart';
import 'package:maveli_mart/screens/dish_details_screen.dart';
import 'package:maveli_mart/screens/sadya_cart_screen.dart';
import 'package:maveli_mart/utils/colors.dart';

class SadyaPlannerScreen extends StatefulWidget {
  const SadyaPlannerScreen({super.key});

  @override
  State<SadyaPlannerScreen> createState() => _SadyaPlannerScreenState();
}

class _SadyaPlannerScreenState extends State<SadyaPlannerScreen> {
  final SadyaListBloc sadyaListBloc = SadyaListBloc();

  List<SadyaListResponseModel> sadyaList = [];
  final List<SadyaListResponseModel> selectedDishes = []; // Dynamic Cart State

  @override
  void initState() {
    super.initState();
    sadyaListBloc.add(GetSadyaListEvent());
  }

  @override
  void dispose() {
    sadyaListBloc.close();
    super.dispose();
  }

  void _navigateToCart() async {
    final updatedCart = await Navigator.push<List<SadyaListResponseModel>>(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(selectedDishes: selectedDishes),
      ),
    );

    // Sync items if modified or removed inside CartScreen
    if (updatedCart != null) {
      setState(() {
        selectedDishes.clear();
        selectedDishes.addAll(updatedCart);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: neutral,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
          maxWidth: 700, // Maximum width for web screens
        ),
          child: BlocBuilder<SadyaListBloc, SadyaListState>(
            bloc: sadyaListBloc,
            builder: (context, state) {
              if (state is SadyaListLoadingState && sadyaList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }
          
              if (state is SadyaListSuccessState) {
                sadyaList = state.successResponse;
              }
          
              if (state is SadyaListErrorState && sadyaList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red, size: 48),
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
                          sadyaListBloc.add(GetSadyaListEvent());
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
          
              if (sadyaList.isEmpty) {
                return const Center(
                  child: Text(
                    'Sadya list is empty',
                    style: TextStyle(
                      fontFamily: "Vietnam",
                      color: labelColor,
                      fontSize: 18,
                    ),
                  ),
                );
              }
          
              return RefreshIndicator(
                color: primaryColor,
                onRefresh: () async {
                  sadyaListBloc.add(GetSadyaListEvent());
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('🍛', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 8),
                          Text(
                            'Sadya Planner',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                              fontFamily: "NotoSerif",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Curate your perfect traditional feast. Select\n'
                        'from our fresh, authentic Kerala dishes.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: labelColor,
                          height: 1.3,
                          fontFamily: "Vietnam",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
          
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: sadyaList.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final dish = sadyaList[index];
                          final isSelected = selectedDishes.contains(dish);
          
                          return _buildDishCard(
                            dish: dish,
                            index: index,
                            isSelected: isSelected,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),

      // Floating bottom bar when items are selected
     bottomNavigationBar: selectedDishes.isNotEmpty
    ? Container(
        color: Colors.white, // Background spans full screen width
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centers horizontally without expanding vertically
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 700, // Matches your web body max-width
                  ),
                  child: Container(
                    width: double.infinity, // Stretches to fill mobile screens, caps at 500 on web
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: _navigateToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, // Make sure primaryColor is defined
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${selectedDishes.length} Items Added',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Vietnam",
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                'View Leaf',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Vietnam",
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    : null,
      // bottomNavigationBar: selectedDishes.isNotEmpty
      //     ? Container(
      //         padding: const EdgeInsets.all(16),
      //         decoration: const BoxDecoration(
      //           color: Colors.white,
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.black12,
      //               blurRadius: 10,
      //               offset: Offset(0, -2),
      //             ),
      //           ],
      //         ),
      //         child: ElevatedButton(
      //           onPressed: _navigateToCart,
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: primaryColor,
      //             padding: const EdgeInsets.symmetric(
      //               vertical: 14,
      //               horizontal: 20,
      //             ),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 '${selectedDishes.length} Items Added',
      //                 style: const TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.bold,
      //                   fontFamily: "Vietnam",
      //                 ),
      //               ),
      //               Row(
      //                 children: const [
      //                   Text(
      //                     'View Leaf',
      //                     style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 15,
      //                       fontWeight: FontWeight.bold,
      //                       fontFamily: "Vietnam",
      //                     ),
      //                   ),
      //                   SizedBox(width: 6),
      //                   Icon(
      //                     Icons.arrow_forward,
      //                     color: Colors.white,
      //                     size: 18,
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       )
      //     : null,
    );
  }

  Widget _buildDishCard({
    required SadyaListResponseModel dish,
    required int index,
    required bool isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? primaryColor : const Color(0xFFEFE6D5),
          width: isSelected ? 2.0 : 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DishDetailScreen(dish: dish),
                ),
              );
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    _getDishImage(dish.id),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200,
                      width: double.infinity,
                      color: const Color(0xFFF3EBDD),
                      child: const Icon(Icons.restaurant, color: primaryColor),
                    ),
                  ),
                ),
                // 2. Tap Detail Indicator Badge
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.45),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.info_outline, // Or Icons.info_outline
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        dish.name ?? 'Unknown Dish',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: "NotoSerif",
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '₹${dish.cost ?? 0}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                          fontFamily: "Vietnam",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  dish.description ?? 'Traditional Kerala Sadya dish.',
                  style: const TextStyle(
                    fontSize: 12,
                    color: labelColor,
                    height: 1.4,
                    fontFamily: "Vietnam",
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (isSelected) {
                          selectedDishes.remove(dish);
                        } else {
                          selectedDishes.add(dish);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected
                          ? Colors.red.shade700
                          : primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: Icon(
                      isSelected ? Icons.remove : Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    label: Text(
                      isSelected ? 'Remove from Sadya' : 'Add to Sadya',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Vietnam",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // ================================================================
  // DISH IMAGE
  // ================================================================

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
}