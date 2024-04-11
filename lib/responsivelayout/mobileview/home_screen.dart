import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Mobilehomescreen extends StatefulWidget {
  const Mobilehomescreen({super.key});
  @override
  State<Mobilehomescreen> createState() => _MobilehomescreenState();
}

class _MobilehomescreenState extends State<Mobilehomescreen> {
  String username = "";

  @override
  void initState() {
    getUsernname();
    super.initState();
  }

  String uid = FirebaseAuth.instance.currentUser!.uid;
  void getUsernname() async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      username = (snap.data()! as Map<String, dynamic>)['Username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
        body: Center(
      child: Text(username),
    ));
  }
}
