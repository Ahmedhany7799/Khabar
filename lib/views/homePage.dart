import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../main.dart';
import '../widgets/NewsListViewBuilder.dart';
import 'homeScreens/bookmark.dart';
import 'homeScreens/explore.dart';
import 'homeScreens/profile.dart';
import 'homeScreens/profiledetails.dart';
import 'newspage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isPressed = true;
  int _currentIndex = 0;
  final List _navScreens = [
    const Homepage(),
    const ExploreScreen(),
    const BookmarkScreen(),
    userToken == null ? const ProfileScreen() : const ProfileDetails(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(160.0),
              topRight: Radius.circular(160.0)),
        ),

        child: GNav(
            selectedIndex: _currentIndex,
            gap: 8,
            backgroundColor: const Color(0xffF6F6F6),
            color: const Color.fromRGBO(24, 119, 242, 1),
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade300,
            padding: const EdgeInsets.all(16),
            onTabChange: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            tabs: [
              GButton(
                icon: isPressed ? Icons.home_outlined : Icons.home,
                text: "Home",
                onPressed: () {},
              ),
              GButton(
                  icon: isPressed ? Icons.explore_outlined : Icons.explore,
                  text: "Explore"),
              GButton(
                  icon: isPressed ? Icons.bookmark_outlined : Icons.bookmark,
                  text: "Bookmark"),
              GButton(
                  icon: isPressed ? Icons.person_outlined : Icons.person,
                  text: "Profile"),
            ]),

        // ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
        title: const Image(
          image: AssetImage("assets/logo.jpg"),
          width: 170,
          height: 100,
        ),
        elevation: 0,
        actions: const [
          Icon(
            Icons.notifications_outlined,
            size: 30,
            color: Color.fromRGBO(24, 119, 242, 1),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _navScreens.elementAt(_currentIndex),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Newspage(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 32,
                  ),
                ),
                NewsListViewBuilder(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
