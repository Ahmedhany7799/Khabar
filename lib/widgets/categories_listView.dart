import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../models/newsitem.dart';
import 'customcardd.dart';

class categorieCard extends StatefulWidget {
  const categorieCard({super.key});

  @override
  State<categorieCard> createState() => _categorieCardState();
}

class _categorieCardState extends State<categorieCard> {
  List<newsCard> cards = const [
    newsCard(text: "business", image: "assets/business.avif"),
    newsCard(text: "entertaiment", image: "assets/entertaiment.avif"),
    newsCard(text: "general", image: "assets/general.avif"),
    newsCard(text: "health", image: "assets/health.avif"),
    newsCard(text: "science", image: "assets/science.avif"),
    newsCard(text: "sports", image: "assets/sports.avif"),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: cards.map((e) => CustomCardd(item: e)).toList(),
        options: CarouselOptions(
          //height: 150,

          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,

          scrollDirection: Axis.horizontal,
        ));

    /*ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount:cards.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: customCardd(

             item: cards[index],
            ),
          ) ;
        });*/
  }
}
