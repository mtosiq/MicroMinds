import 'package:flutter/material.dart';

const _bg1 = Color(0xFF030B14);
const _bg2 = Color(0xFF071220);

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg1,
      appBar: AppBar(
        title: const Text(
          "MacroMind",
          style:
              TextStyle(color: Color(0xFF00C896), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: _bg2,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
