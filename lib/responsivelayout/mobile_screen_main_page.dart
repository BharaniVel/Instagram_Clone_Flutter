import 'package:flutter/material.dart';

class Mobilelayouthomepage extends StatefulWidget {
  const Mobilelayouthomepage({super.key});

  @override
  State<Mobilelayouthomepage> createState() => _MobilelayouthomepageState();
}

class _MobilelayouthomepageState extends State<Mobilelayouthomepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(child: Text('This is the main page of the Instagram')),
        ],
      ),
    );
  }
}
