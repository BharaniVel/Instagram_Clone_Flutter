import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';

class Addpostoptions extends StatelessWidget {
  final String options;
  final IconData? icon;

  const Addpostoptions({
    super.key,
    required this.options,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: bordercolor,
          ),
          bottom: BorderSide(
            width: 0.5,
            color: bordercolor,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 15,
              right: 30,
            ),
            child: Icon(
              icon,
              color: primaryColor,
            ),
          ),
          Expanded(
            child: Text(
              options,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: secondaryColor,
          ),
        ],
      ),
    );
  }
}
