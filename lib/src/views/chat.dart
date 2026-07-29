import 'package:flutter/material.dart';

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Chef")),
      body: Column(
        children: [
          Expanded(
            child: ListView(),
          ),
          TextField(),
        ],
      ),
    );
  }
}
