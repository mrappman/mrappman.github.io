import 'package:flutter/material.dart';
import 'package:maveli_mart/data/models/flower_list_response.dart';
import 'package:maveli_mart/utils/colors.dart';

class PookalamBuilderScreen extends StatefulWidget {
  final List<Flower> availableFlowers;

  const PookalamBuilderScreen({super.key, required this.availableFlowers});

  @override
  State<PookalamBuilderScreen> createState() => _PookalamBuilderScreenState();
}

class _PookalamBuilderScreenState extends State<PookalamBuilderScreen> {
  int _activeLayerIndex = 0; // 0 = Center, 1 = Middle, 2 = Outer
  final int _totalLayers = 3;

  // Selected flower per layer
  final Map<int, Flower?> _layerFlowers = {0: null, 1: null, 2: null};

  Color _getFlowerDisplayColor(Flower? flower) {
    if (flower == null || flower.colors == null || flower.colors!.isEmpty) {
      return const Color(0xFFFFFBF3);
    }

    final primaryColor = flower.colors!.first.toLowerCase().trim();

    switch (primaryColor) {
      case 'red':
        return const Color(0xFFD32F2F);

      case 'orange':
        return const Color(0xFFF57C00);

      case 'yellow':
        return const Color(0xFFFBC02D);

      case 'pink':
        return const Color(0xFFE91E63);

      case 'magenta':
        return const Color(0xFFD81B60);

      case 'purple':
        return const Color(0xFF9C27B0);

      case 'blue':
        return const Color(0xFF1976D2);

      case 'white':
        return Colors.white;

      default:
        return const Color(0xFFFFFBF3);
    }
  }

  void _applyFlowerToLayer(Flower flower) {
    setState(() {
      _layerFlowers[_activeLayerIndex] = flower;
    });
  }

  @override
  Widget build(BuildContext context) {
    final centerColor = _getFlowerDisplayColor(_layerFlowers[0]);
    final middleColor = _getFlowerDisplayColor(_layerFlowers[1]);
    final outerColor = _getFlowerDisplayColor(_layerFlowers[2]);
    final selectedFlower = _layerFlowers[_activeLayerIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Design Your Pookalam',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: primaryColor),
            onPressed: () {
              setState(() {
                _layerFlowers[0] = null;
                _layerFlowers[1] = null;
                _layerFlowers[2] = null;
              });
            },
          ),
        ],
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),

                        // Layer Selection Indicator Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Target: Layer ${_activeLayerIndex + 1} of $_totalLayers (${_activeLayerIndex == 0
                                  ? "Center"
                                  : _activeLayerIndex == 1
                                  ? "Middle Ring"
                                  : "Outer Ring"})',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1B4D2E),
                                fontFamily: "Vietnam",
                              ),
                            ),
                            const Text(
                              'Tap layer to edit',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                                fontFamily: "Vietnam",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children: List.generate(_totalLayers, (index) {
                            final isSelected = _activeLayerIndex == index;
                            return Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => _activeLayerIndex = index),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: 6,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFF1B4D2E)
                                        : const Color(0xFFEFE6D5),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 24),

                        // Concentric Circular Canvas
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _activeLayerIndex =
                                  (_activeLayerIndex + 1) % _totalLayers;
                            });
                          },
                          child: Center(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 240,
                              height: 240,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: outerColor,
                                border: Border.all(
                                  color: _activeLayerIndex == 2
                                      ? const Color(0xFF1B4D2E)
                                      : const Color(0xFFEFE6D5),
                                  width: _activeLayerIndex == 2 ? 4 : 1.5,
                                ),
                              ),
                              child: Center(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: middleColor,
                                    border: Border.all(
                                      color: _activeLayerIndex == 1
                                          ? const Color(0xFF1B4D2E)
                                          : const Color(0xFFEFE6D5),
                                      width: _activeLayerIndex == 1 ? 4 : 1.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: centerColor,
                                        border: Border.all(
                                          color: _activeLayerIndex == 0
                                              ? const Color(0xFF1B4D2E)
                                              : const Color(0xFFEFE6D5),
                                          width: _activeLayerIndex == 0
                                              ? 4
                                              : 1.5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          _layerFlowers[0]?.name ?? 'Center',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: _layerFlowers[0] != null
                                                ? Colors.black87
                                                : Colors.black45,
                                            fontFamily: "Vietnam",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Dynamic Layer Flower Metadata Card
                        if (selectedFlower != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFBF3),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFEFE6D5),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedFlower.name ?? '',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Vietnam",
                                      ),
                                    ),
                                    if (selectedFlower.scientificName != null)
                                      Text(
                                        selectedFlower.scientificName!,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey,
                                        ),
                                      ),
                                  ],
                                ),
                                if (selectedFlower.freshnessHours != null)
                                  Text(
                                    'Freshness: ${selectedFlower.freshnessHours}h',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                      fontFamily: "Vietnam",
                                    ),
                                  ),
                              ],
                            ),
                          ),

                        const SizedBox(height: 20),

                        // Dynamic Flower Selection Palette
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Select Flower for Layer',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontFamily: "Vietnam",
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        widget.availableFlowers.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Center(
                                  child: Text(
                                    'No flowers available',
                                    style: TextStyle(
                                      color: labelColor,
                                      fontFamily: "Vietnam",
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 95,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.availableFlowers.length,
                                  itemBuilder: (context, index) {
                                    final flower =
                                        widget.availableFlowers[index];
                                    final displayColor = _getFlowerDisplayColor(
                                      flower,
                                    );
                                    final isSelectedForCurrentLayer =
                                        _layerFlowers[_activeLayerIndex]
                                            ?.name ==
                                        flower.name;

                                    return GestureDetector(
                                      onTap: () => _applyFlowerToLayer(flower),
                                      child: Container(
                                        width: 85,
                                        margin: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: isSelectedForCurrentLayer
                                              ? const Color(0xFFFFFBF3)
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: isSelectedForCurrentLayer
                                                ? primaryColor
                                                : const Color(0xFFEFE6D5),
                                            width: isSelectedForCurrentLayer
                                                ? 2
                                                : 1,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: displayColor,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              flower.name ?? 'Flower',
                                              style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Vietnam",
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              '₹${flower.costPerKg ?? 0}/kg',
                                              style: const TextStyle(
                                                fontSize: 9,
                                                color: labelColor,
                                                fontFamily: "Vietnam",
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
