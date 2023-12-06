import 'package:flutter/material.dart';
import 'package:newsapp/models/newsitem.dart';

class CustomCardd extends StatelessWidget {
  const CustomCardd({
    super.key,
    required this.item,
  });
  final newsCard item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: 290,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Text(
        item.text,
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      )),
    );
  }
}
