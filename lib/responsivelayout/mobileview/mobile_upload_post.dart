import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/responsivelayout/mobileview/addpost_options.dart';

class AddpostMobile extends StatefulWidget {
  const AddpostMobile({super.key});

  @override
  State<AddpostMobile> createState() => _AddpostMobileState();
}

class _AddpostMobileState extends State<AddpostMobile> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     onPressed: () {},
    //     icon: const Icon(Icons.upload),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'New post',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 270,
            width: 280,
            margin: const EdgeInsets.only(
              left: 0,
              top: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/media/GKVH3vYWMAAiOuD?format=jpg&name=900x900'))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Container(
              height: 150,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: '    Write a caption or add a poll....',
                  border: InputBorder.none,
                ),
                maxLines: 4,
              ),
            ),
          ),
          const Addpostoptions(options: 'Tag People', icon: Icons.tag),
          const Addpostoptions(options: 'Add music', icon: Icons.music_note),
          const Addpostoptions(
              options: 'Add product details', icon: Icons.shopping_bag),
          const Addpostoptions(
              options: 'Add remainder', icon: Icons.calendar_month),
          const Addpostoptions(options: 'Add location', icon: Icons.map),
        ],
      ),
    );
  }
}
