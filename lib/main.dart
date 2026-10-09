import 'dart:math';
import 'package:flutter/material.dart';


void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false,home: HamsterGacha()));

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});
  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int n = 0, e = 0;
  bool loading = false;
  final emojis = ['🐕', '🐩', '🐕‍🦺','🦮'];
  final images = [
    'images/daikichi.jpg',
    'images/cyukichi.jpg',
    'images/kichi.jpg',
    'images/syokichi.jpg',
    'images/kyo.jpg'
  ];
  Future<void> gacha() async {
    setState(() => loading = true);
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() => e = (e + 1) % emojis.length);
    }
    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color.fromARGB(255, 246, 240, 226),
    appBar: AppBar(backgroundColor: const Color.fromARGB(255, 255, 77,0),foregroundColor: Colors.white,title: const Text('⛩️わんわん御神籤⛩️')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 300,
            child: loading
                ? Center(
                    child: Text(
                      emojis[e],
                      style: const TextStyle(fontSize: 100),
                    ),
                  )
                : Image.asset(images[n], fit: BoxFit.cover),
          ),
          const SizedBox(height: 30),
          const Text('⛩️', style: TextStyle(fontSize: 72)),
          ElevatedButton(
            onPressed: loading ? null : gacha,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 77,0),
              foregroundColor: Colors.white,
            ),
            child: const Text('御神籤をひく'),
          ),
        ],
      ),
    ),
  );
}