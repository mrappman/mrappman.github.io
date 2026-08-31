import 'package:flutter/material.dart';

class MaveligramScreen extends StatefulWidget {
  const MaveligramScreen({super.key});

  @override
  State<MaveligramScreen> createState() => _MaveligramScreenState();
}

class _MaveligramScreenState extends State<MaveligramScreen> {
  bool isJoined = false;

  static const primaryGreen = Color(0xFF228B22);
  static const backgroundColor = Color(0xFFFDF5E6);
  static const cardBorderColor = Color(0xFFEFE6D5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: const [
            Text(
              'Maveligram',
              style: TextStyle(
                color: primaryGreen,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                fontFamily: 'NotoSerif',
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isJoined ? _buildCommunityFeed() : _buildWelcomeView(),
          ),
        ),
      ),
    );
  }

  // --- WELCOME STATE ---
  Widget _buildWelcomeView() {
    return Padding(
      key: const ValueKey('WelcomeView'),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: primaryGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.castle, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 24),
          const Text(
            'Welcome, Praja!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryGreen,
              fontFamily: 'NotoSerif',
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Join the official Pathalam community created by King Maveli & team to stay updated with Pathalam news & updates.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black87,
              height: 1.4,
              fontFamily: 'Vietnam',
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton.icon(
              onPressed: () => setState(() => isJoined = true),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              icon: const Icon(Icons.group_add, color: Colors.white, size: 18),
              label: const Text(
                'Join Community',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Vietnam',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- COMMUNITY FEED LISTING ---
  Widget _buildCommunityFeed() {
    return ListView(
      key: const ValueKey('CommunityFeed'),
      padding: const EdgeInsets.all(16),
      children: [
        // Joined Banner
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: cardBorderColor),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: primaryGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.groups, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '👑 Pathalam Community',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '128,452 Praja',
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'Joined',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Post 1: Maveli (Tech / Local Humor)
        _buildPostCard(
          author: 'Maveli',
          isOfficial: true,
          handle: '@mahabali • 1h ago',
          location: 'Royal Pathalam Palace',
          text:
              'Tried to set up "Pathalam Pay" for instant coconut-token transfers. My Royal Counsel says we still need physical palm-leaf receipts for auditing. Some traditions never change! 📜🌴',
          imageUrl: 'assets/images/maveli_news.webp',
          likes: '2.4K',
          comments: '142',
          smallIcon: '👑',
        ),

        // Post 2: Pathalam News (Civic & Infrastructure Update)
        _buildPostCard(
          author: 'Pathalam News',
          isOfficial: true,
          handle: '@pathalam_news • 3h ago',
          location: 'Underworld Highway 4',
          text:
              'Notice to all Prajas: The Netherland Eco-Tunnel will be temporarily closed from 2 AM to 4 AM for routine floral garland clearing and lantern maintenance. Please plan your portal commutes accordingly. 🚧🌺',
          imageUrl: 'assets/images/pathalam_news.webp',
          likes: '890',
          comments: '56',
          smallIcon: '📢',
        ),

        // Post 3: Royal Heritage Trust (Thoughtful Community Reflection)
        _buildPostCard(
          author: 'Royal Heritage Trust',
          isOfficial: true,
          handle: '@pathalam_heritage • 5h ago',
          location: 'Nether Realm Archives',
          text:
              'True prosperity isn\'t just about gold coins in the vault—it\'s about ensuring every house has enough rice to share and every neighbor feels heard. King Maveli’s rule continues to remind us that equality is our greatest wealth. ❤️🌾',
          imageUrl: 'assets/images/rice_news.webp',
          likes: '3.1K',
          comments: '210',
          smallIcon: '🏛️',
        ),

        // Post 4: Royal Elephant Guard (Lighthearted Local Banter)
        _buildPostCard(
          author: 'Royal Elephant Guard',
          isOfficial: false,
          handle: '@gaja_squad • 7h ago',
          location: 'Pathalam Central Courtyard',
          text:
              'Lost: One golden umbrella (Muthukkuda). Last seen near the mango groves. If found, please return to Guard Duty—Maveli says I can\'t stand in the afternoon sun without it! ☂️☀️',
          imageUrl: 'assets/images/guard_news.webp',
          likes: '1.5K',
          comments: '98',
          smallIcon: '🐘',
        ),
      ],
    );
  }

  Widget _buildPostCard({
    required String author,
    required bool isOfficial,
    required String handle,
    required String location,
    required String text,
    required String imageUrl,
    required String likes,
    required String comments,
    required String smallIcon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFFF1E4CE), // Light warm background
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(smallIcon, style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          author,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Vietnam',
                          ),
                        ),
                        if (isOfficial) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'OFFICIAL',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    Text(
                      handle,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 8),

          // Content Text
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              height: 1.3,
              fontFamily: 'Vietnam',
            ),
          ),
          if (location.isNotEmpty) ...[
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on, size: 10, color: primaryGreen),
                  const SizedBox(width: 4),
                  Text(
                    location,
                    style: const TextStyle(fontSize: 10, color: primaryGreen),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 10),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),

          // Action Footer
          Row(
            children: [
              const Icon(
                Icons.favorite_border,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 4),
              Text(
                likes,
                style: const TextStyle(fontSize: 11, color: Colors.black54),
              ),
              const SizedBox(width: 16),
              const Icon(
                Icons.chat_bubble_outline,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 4),
              Text(
                comments,
                style: const TextStyle(fontSize: 11, color: Colors.black54),
              ),
              const Spacer(),
              const Icon(Icons.share_outlined, size: 16, color: Colors.black54),
            ],
          ),
        ],
      ),
    );
  }
}
