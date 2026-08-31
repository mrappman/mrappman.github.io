import 'package:flutter/material.dart';
import 'package:maveli_mart/utils/colors.dart';

class ChatMessage {
  final String text;
  final bool isMaveli;
  final String time;

  ChatMessage({required this.text, required this.isMaveli, required this.time});
}

class RoyalChatScreen extends StatefulWidget {
  const RoyalChatScreen({super.key});

  @override
  State<RoyalChatScreen> createState() => _RoyalChatScreenState();
}

class _RoyalChatScreenState extends State<RoyalChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Initial Conversation Flow
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: 'Greetings, dear praja! How can I help you today?',
      isMaveli: true,
      time: '10:02 AM',
    ),
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: text, isMaveli: false, time: 'Just now'));
      _messageController.clear();
    });

    _scrollToBottom();

    // Auto-reply after 1 second delay
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _messages.add(
          ChatMessage(
            text:
                'I am currently stuck in heavy Onam processional traffic near Athachamayam, but your message has been noted! I will reply to you soon, dear praja.',
            isMaveli: true,
            time: 'Just now',
          ),
        );
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Royal Chat',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "NotoSerif",
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFEFE6D5),
                  backgroundImage: AssetImage(
                    'assets/images/maveli_avatar.png',
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.lightGreenAccent.shade700,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700, // Caps maximum snackbar width for web screens
          ),
          child: SafeArea(
            child: Container(
              color: Colors.grey.shade50,
              child: Column(
                children: [
                  // Date Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFE6D5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: "Vietnam",
                        ),
                      ),
                    ),
                  ),

                  // Message List
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        final showAvatar =
                            message.isMaveli &&
                            (index == _messages.length - 1 ||
                                !_messages[index + 1].isMaveli);

                        return _buildChatBubble(message, showAvatar);
                      },
                    ),
                  ),

                  // Bottom Input Bar
                  _buildInputBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble(ChatMessage message, bool showAvatar) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: message.isMaveli
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (message.isMaveli) ...[
            SizedBox(
              width: 32,
              height: 32,
              child: showAvatar
                  ? const CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xFFEFE6D5),
                      backgroundImage: AssetImage(
                        'assets/images/maveli_avatar.png',
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: message.isMaveli
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: message.isMaveli
                        ? const Color(0xFFFFF7E6)
                        : const Color(0xFF388E3C),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(message.isMaveli ? 4 : 16),
                      bottomRight: Radius.circular(message.isMaveli ? 16 : 4),
                    ),
                    border: message.isMaveli
                        ? Border.all(color: const Color(0xFFEFE6D5))
                        : null,
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isMaveli ? Colors.black87 : Colors.white,
                      fontSize: 14,
                      height: 1.4,
                      fontFamily: "Vietnam",
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message.time,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontFamily: "Vietnam",
                  ),
                ),
              ],
            ),
          ),
          if (!message.isMaveli) const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFFFAF7EE),
        border: Border(top: BorderSide(color: Color(0xFFEFE6D5), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: const Color(0xFFEFE6D5)),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.black54,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                      decoration: const InputDecoration(
                        hintText: 'Type a royal message...',
                        hintStyle: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          fontFamily: "Vietnam",
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
