import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/views/homePage.dart';
import 'package:newsapp/views/searchscreen.dart';
import 'package:newsapp/widgets/categories_listView.dart';

class Newspage extends StatelessWidget {
  Newspage({super.key});
  static List previousSearches = [];
  var intController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello !",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            Text(
              "What are you looking for today?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SearchPage2())),
                  child: SizedBox(
                    width: 350.w,
                    child: const TSearchContainer(
                      text: "Search yaa bashaa...",
                      enabled: false,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TSearchContainer extends StatefulWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
    required this.enabled,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder, enabled;

  @override
  State<TSearchContainer> createState() => _TSearchContainerState();
}

class _TSearchContainerState extends State<TSearchContainer> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Center(
        child: TextFormField(
          controller: searchController,
          onTap: () => searchController.clear(),
          onChanged: (pure) {
            setState(() {});
          },
          onEditingComplete: () {
            Newspage.previousSearches.add(searchController.text);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          decoration: InputDecoration(
            filled: true,
            enabled: widget.enabled,
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: searchController.text.isEmpty
                ? null
                : const Icon(Icons.cancel_sharp),
            hintText: "Search yaa bashaa....",
            hintStyle: TextStyle(
              fontSize: 15.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
