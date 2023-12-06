// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/views/homePage.dart';

import 'HomePage.dart';
import 'newspage.dart';

class SearchPage2 extends StatelessWidget {
  SearchPage2({super.key});

  var intController = TextEditingController();

  var int2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Search",
            style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(10, 207, 131, 1)),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              // onPressed: () => Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => const Homepage())),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 310.w,
                      child: const TSearchContainer(
                        text: "Search yaa bashaa...",
                        enabled: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  color: Colors.white,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Newspage.previousSearches.length,
                      itemBuilder: (context, index) =>
                          previousSearchitems(index)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  previousSearchitems(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Dismissible(
          key: GlobalKey(),
          onDismissed: (DismissDirection dir) {
            Newspage.previousSearches.removeAt(index);
          },
          child: Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.clock,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                Newspage.previousSearches[index],
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.call_made_outlined,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
