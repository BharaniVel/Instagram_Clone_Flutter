import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/responsivelayout/mobileview/mobile_upload_post.dart';

class mobileview extends StatefulWidget {
  const mobileview({super.key});

  @override
  State<mobileview> createState() => _mobileviewState();
}

class _mobileviewState extends State<mobileview> {
  int _ispage = 0;
  late PageController pagecontroller = PageController();

  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  void navigationTapped(int page) {
    pagecontroller.jumpToPage(page);
  }

  void pagechanged(int page) {
    setState(() {
      _ispage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Center(child: Text('feed')),
          Center(child: Text('Search')),
          const AddpostMobile(),
          Center(child: Text('likes')),
          Center(child: Text('Profile')),
        ],
        controller: pagecontroller,
        onPageChanged: pagechanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        height: 60,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _ispage == 0 ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _ispage == 1 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: _ispage == 2 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _ispage == 3 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _ispage == 4 ? primaryColor : secondaryColor,
            ),
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
