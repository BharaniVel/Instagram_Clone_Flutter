import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/responsivelayout/mobileview/post/postcard.dart';

class Feedscreen extends StatelessWidget {
  const Feedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              top: -40,
              left: 40,
              child: Image.asset(
                'assets/images/instagram_icon.png',
                height: 200, // Adjust the height as needed
              ),
            ),
            // Add any additional widgets or spacing here if needed
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Postcardmobile(
                snap: snapshot.data!.docs[index],
              ),
            );
          }),
    );
  }
}
