import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              physics: const BouncingScrollPhysics(),
              itemCount: demoMessages.length,
              reverse: true, // Show the latest message at the bottom
              itemBuilder: (context, index) {
                final message = demoMessages[index];
                return Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: message.isSentByMe
                          ? Colors.deepPurple
                          : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft: message.isSentByMe
                            ? const Radius.circular(12)
                            : Radius.zero,
                        bottomRight: message.isSentByMe
                            ? Radius.zero
                            : const Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color:
                            message.isSentByMe ? Colors.white : Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Input field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Text input
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Send button
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.deepPurple,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      // Handle message send logic here
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy message model
class Message {
  final String text;
  final bool isSentByMe;

  Message({
    required this.text,
    required this.isSentByMe,
  });
}

// Sample messages for demonstration
List<Message> demoMessages = [
  Message(text: "Hello! How are you?", isSentByMe: false),
  Message(text: "Hi! I'm good, thank you. How about you?", isSentByMe: true),
  Message(text: "I'm doing great! Thanks for asking.", isSentByMe: false),
  Message(text: "Any updates on the project?", isSentByMe: true),
  Message(
      text: "Yes, we're almost done. Just a few tweaks remaining.",
      isSentByMe: false),
  Message(text: "That's great news!", isSentByMe: true),
];
