import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/colors.dart';

class Postcardmobile extends StatelessWidget {
  final snap;
  const Postcardmobile({
    super.key,
    required this.snap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://images.filmibeat.com/webp/ph-big/2022/12/priyanka-arul-mohan_166997144200.jpg'),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snap['username'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              snap['postURL'],
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.comment_outlined)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 250,
                      ),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(
                left: 15,
              ),
              alignment: Alignment.centerLeft,
              child: const Text('1,236 Likes')),
          Container(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              children: [
                Text(
                  snap['username'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(snap['descrption']),
              ],
            ),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.only(
                left: 15,
              ),
              alignment: Alignment.bottomLeft,
              child: Text(
                'view all 100 comments',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
