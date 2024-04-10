import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class Mobilelayouthomepage extends StatefulWidget {
  const Mobilelayouthomepage({super.key});

  @override
  State<Mobilelayouthomepage> createState() => _MobilelayouthomepageState();
}

class _MobilelayouthomepageState extends State<Mobilelayouthomepage> {
  @override
  Widget build(BuildContext context) {
    // User user =  Provider.of<UserProvider>(context).getUser;
    return const Scaffold(
      body: Column(
        children: [
          Center(child: Text('This is the main page of the Instagram')),
        ],
      ),
    );
  }
}
