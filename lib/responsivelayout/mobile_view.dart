import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/responsivelayout/signup_mobile.dart';
import 'package:instagram_clone/models/user.dart' as models;
import 'package:provider/provider.dart';

class mobileview extends StatefulWidget {
  const mobileview({super.key});

  @override
  State<mobileview> createState() => _mobileviewState();
}

class _mobileviewState extends State<mobileview> {
  @override
  Widget build(BuildContext context) {
    models.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(body: Center(child: Text(user.email)));
  }
}
