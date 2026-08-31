import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maveli_mart/blocs/maveli_tracker_bloc/bloc/maveli_tracker_bloc.dart';
import 'package:maveli_mart/data/models/maveli_tracker_response.dart';
import 'package:maveli_mart/utils/colors.dart';

class MaveliTrackerScreen extends StatefulWidget {
  const MaveliTrackerScreen({super.key});

  @override
  State<MaveliTrackerScreen> createState() => _MaveliTrackerScreenState();
}

class _MaveliTrackerScreenState extends State<MaveliTrackerScreen> {
  final MaveliTrackerBloc maveliTrackerBloc = MaveliTrackerBloc();

  MaveliTrackerModel? maveliTracker;

  @override
  void initState() {
    super.initState();

    maveliTrackerBloc.add(GetMaveliTrackerEvent());
  }

  @override
  void dispose() {
    maveliTrackerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Maveli Tracker',
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
          child: BlocBuilder<MaveliTrackerBloc, MaveliTrackerState>(
            bloc: maveliTrackerBloc,
            builder: (context, state) {
              // ==========================================================
              // LOADING
              // ==========================================================
              if (state is MaveliTrackerLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }

              // ==========================================================
              // SUCCESS
              // ==========================================================

              if (state is MaveliTrackerSuccessState) {
                maveliTracker = state.successResponse;
              }

              // ==========================================================
              // ERROR
              // ==========================================================

              if (state is MaveliTrackerErrorState) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Unable to track Maveli',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.errorMsg,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: labelColor,
                            fontFamily: 'Vietnam',
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () {
                            maveliTrackerBloc.add(GetMaveliTrackerEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // ==========================================================
              // NO DATA
              // ==========================================================

              if (maveliTracker == null) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }

              // ==========================================================
              // MAIN UI
              // ==========================================================

              final data = maveliTracker!;

              return RefreshIndicator(
                color: primaryColor,
                onRefresh: () async {
                  maveliTrackerBloc.add(GetMaveliTrackerEvent());
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // --------------------------------------------------
                      // HEADER
                      // --------------------------------------------------
                      _buildHeader(data),

                      const SizedBox(height: 16),

                      // --------------------------------------------------
                      // LOCATION / MAP
                      // --------------------------------------------------
                      _buildMapCard(data),

                      const SizedBox(height: 16),

                      // --------------------------------------------------
                      // JOURNEY PROGRESS
                      // --------------------------------------------------
                      _buildJourneyProgressCard(data),

                      const SizedBox(height: 16),

                      // --------------------------------------------------
                      // ENERGY LEVEL
                      // --------------------------------------------------
                      _buildMetricCard(
                        icon: Icons.bolt,
                        iconBgColor: const Color(0xFFFFF8E1),
                        iconColor: const Color(0xFFD4A017),
                        label: 'ENERGY LEVEL',
                        value: '${data.energyLevel ?? 0}%',
                      ),

                      const SizedBox(height: 12),

                      // --------------------------------------------------
                      // VELOCITY
                      // --------------------------------------------------
                      _buildMetricCard(
                        icon: Icons.rocket_launch,
                        iconBgColor: const Color(0xFFFBE9E7),
                        iconColor: const Color(0xFFE65100),
                        label: 'VELOCITY',
                        value: '${data.speedKmh ?? 0}',
                        unit: 'km/h',
                      ),

                      const SizedBox(height: 12),

                      // --------------------------------------------------
                      // MOOD INDEX
                      // --------------------------------------------------
                      _buildMetricCard(
                        icon: Icons.sentiment_satisfied_alt,
                        iconBgColor: const Color(0xFFE8F5E9),
                        iconColor: const Color(0xFF2E7D32),
                        label: 'MOOD INDEX',
                        value: (data.moodFactor ?? 0).toStringAsFixed(1),
                        subtext: _getMoodText(data.moodFactor),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------
                      // QUOTE
                      // --------------------------------------------------
                      _buildQuoteCard(data),

                      const SizedBox(height: 16),

                      // --------------------------------------------------
                      // STASH
                      // --------------------------------------------------
                      _buildStashCard(data),

                      const SizedBox(height: 20),

                      // --------------------------------------------------
                      // REFRESH
                      // --------------------------------------------------
                      ElevatedButton.icon(
                        onPressed: () {
                          maveliTrackerBloc.add(GetMaveliTrackerEvent());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: const Text(
                          'Refresh Maveli',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // ================================================================
  // HEADER
  // ================================================================

  Widget _buildHeader(MaveliTrackerModel data) {
    return Column(
      children: [
        const Text(
          '👑 WHERE IS MAVELI?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            height: 1.2,
            fontFamily: 'NotoSerif',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data.status ?? 'Maveli is on his way!',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: labelColor,
            height: 1.4,
            fontFamily: 'Vietnam',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // ================================================================
  // MAP / LOCATION CARD
  // ================================================================

  Widget _buildMapCard(MaveliTrackerModel data) {
    final location = data.location;

    final progress = ((data.checkpointProgressPct ?? 0).clamp(0, 100)) / 100;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBF3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF2ECE1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: primaryColor,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'CURRENT LOCATION',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                          letterSpacing: 0.5,
                          fontFamily: 'Vietnam',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location?.name ?? 'Location unavailable',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'NotoSerif',
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ----------------------------------------------------------
          // MAP IMAGE
          // ----------------------------------------------------------
          ClipRRect(
            child: Image.network(
              'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?q=80&w=1200&auto=format&fit=crop',
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 140,
                  width: double.infinity,
                  color: const Color(0xFFEFE6D5),
                  child: const Icon(
                    Icons.map_outlined,
                    size: 48,
                    color: labelColor,
                  ),
                );
              },
            ),
          ),

          // ----------------------------------------------------------
          // JOURNEY PROGRESS BAR
          // ----------------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress.toDouble(),
                    minHeight: 12,
                    backgroundColor: const Color(0xFFEFE6D5),
                    color: secondaryColor,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Patalam',
                      style: TextStyle(
                        fontSize: 10,
                        color: labelColor,
                        fontFamily: 'Vietnam',
                      ),
                    ),
                    Text(
                      'Journey ${data.checkpointProgressPct ?? 0}%',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontFamily: 'Vietnam',
                      ),
                    ),
                    const Text(
                      'Every Home',
                      style: TextStyle(
                        fontSize: 10,
                        color: labelColor,
                        fontFamily: 'Vietnam',
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

  // ================================================================
  // JOURNEY TIMELINE
  // ================================================================

  Widget _buildJourneyProgressCard(MaveliTrackerModel data) {
    final checkpoints = data.checkpoints ?? [];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.alt_route, color: primaryColor, size: 20),
              SizedBox(width: 8),
              Text(
                'Journey Progress',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                  fontFamily: 'NotoSerif',
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          if (checkpoints.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  'No journey checkpoints available.',
                  style: TextStyle(
                    fontSize: 13,
                    color: labelColor,
                    fontFamily: 'Vietnam',
                  ),
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: checkpoints.length,
              itemBuilder: (context, index) {
                final checkpoint = checkpoints[index];

                final isVisited = checkpoint.visited == true;

                final isCurrent =
                    !isVisited && checkpoint.name == data.location?.name;

                final isLast = index == checkpoints.length - 1;

                late Widget leadingIcon;
                late Color statusColor;
                late String status;

                // --------------------------------------------------
                // VISITED
                // --------------------------------------------------

                if (isVisited) {
                  leadingIcon = const CircleAvatar(
                    radius: 14,
                    backgroundColor: primaryColor,
                    child: Icon(Icons.check, size: 16, color: Colors.white),
                  );

                  statusColor = primaryColor;
                  status = 'Visited';
                }
                // --------------------------------------------------
                // CURRENT
                // --------------------------------------------------
                else if (isCurrent) {
                  leadingIcon = const CircleAvatar(
                    radius: 14,
                    backgroundColor: secondaryColor,
                    child: Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.white,
                    ),
                  );

                  statusColor = secondaryColor;
                  status = 'Current Location';
                }
                // --------------------------------------------------
                // UPCOMING
                // --------------------------------------------------
                else {
                  leadingIcon = Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade400, width: 2),
                      color: const Color(0xFFEFE6D5),
                    ),
                  );

                  statusColor = Colors.grey;
                  status = 'Upcoming';
                }

                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          leadingIcon,
                          if (!isLast)
                            Expanded(
                              child: Container(
                                width: 2,
                                color: const Color(0xFFEFE6D5),
                                margin: const EdgeInsets.symmetric(vertical: 4),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                checkpoint.name ?? 'Unknown location',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: isCurrent
                                      ? const Color(0xFF0F7A26)
                                      : const Color(0xFF2C2C2C),
                                  fontFamily: 'Vietnam',
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                status,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: isCurrent
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: statusColor,
                                  fontFamily: 'Vietnam',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  // ================================================================
  // METRIC CARD
  // ================================================================

  Widget _buildMetricCard({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String label,
    required String value,
    String? unit,
    String? subtext,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: labelColor,
                    letterSpacing: 0.5,
                    fontFamily: 'Vietnam',
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2C2C),
                        fontFamily: 'Vietnam',
                      ),
                    ),

                    if (unit != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        unit,
                        style: const TextStyle(
                          fontSize: 12,
                          color: labelColor,
                          fontFamily: 'Vietnam',
                        ),
                      ),
                    ],

                    if (subtext != null && subtext.isNotEmpty) ...[
                      const SizedBox(width: 4),
                      Text(
                        subtext,
                        style: const TextStyle(
                          fontSize: 12,
                          color: labelColor,
                          fontFamily: 'Vietnam',
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // MOOD TEXT
  // ================================================================

  String _getMoodText(double? mood) {
    if (mood == null) {
      return '';
    }

    if (mood >= 0.8) {
      return '(Very Cheerful)';
    }

    if (mood >= 0.6) {
      return '(Cheerful)';
    }

    if (mood >= 0.4) {
      return '(Calm)';
    }

    if (mood >= 0.2) {
      return '(Tired)';
    }

    return '(Sleepy)';
  }

  // ================================================================
  // QUOTE CARD
  // ================================================================

  Widget _buildQuoteCard(MaveliTrackerModel data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: primaryColor,
              child: const Icon(
                Icons.format_quote,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, left: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"${data.quote ?? 'Maveli is enjoying his journey!'}"',
                  style: const TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: labelColor,
                    height: 1.4,
                    fontFamily: 'Vietnam',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '- MAHABALI',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    letterSpacing: 0.5,
                    fontFamily: 'Vietnam',
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
  // STASH CARD
  // ================================================================

  Widget _buildStashCard(MaveliTrackerModel data) {
    final gifts = data.giftsBag ?? [];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFE6D5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.card_giftcard, color: Color(0xFFE67E00), size: 18),
              SizedBox(width: 8),
              Text(
                "Maveli's Stash",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                  fontFamily: 'NotoSerif',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          if (gifts.isEmpty)
            const Text(
              'Maveli has an empty stash!',
              style: TextStyle(
                fontSize: 13,
                color: labelColor,
                fontFamily: 'Vietnam',
              ),
            )
          else
            ...gifts.map(
              (gift) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildStashItem('🎁', gift),
              ),
            ),
        ],
      ),
    );
  }

  // ================================================================
  // STASH ITEM
  // ================================================================

  Widget _buildStashItem(String emoji, String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF4E8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: labelColor,
                fontFamily: 'Vietnam',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
