
import 'package:dankookcoffee/review/tool.dart';
import 'package:flutter/material.dart';

class RatingButton extends StatefulWidget {
  Rating rating = Rating(rating: 0);
  RatingButton({required this.rating});

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: AssetImage('assets/images/profile_image.png'))),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  widget.rating.rating = 1;
                });
              },
              icon: Icon(Icons.star,
                  color: widget.rating.rating >= 1 ? Colors.yellow : Colors.grey),
              iconSize: 30),
          IconButton(
              onPressed: () {
                setState(() {
                  widget.rating.rating = 2;
                });
              },
              icon: Icon(Icons.star,
                  color: widget.rating.rating >= 2 ? Colors.yellow : Colors.grey),
              iconSize: 30),
          IconButton(
              onPressed: () {
                setState(() {
                  widget.rating.rating = 3;
                });
              },
              icon: Icon(Icons.star,
                  color: widget.rating.rating >= 3 ? Colors.yellow : Colors.grey),
              iconSize: 30),
          IconButton(
              onPressed: () {
                setState(() {
                  widget.rating.rating = 4;
                });
              },
              icon: Icon(Icons.star,
                  color: widget.rating.rating >= 4 ? Colors.yellow : Colors.grey),
              iconSize: 30),
          IconButton(
              onPressed: () {
                setState(() {
                  widget.rating.rating = 5;
                });
              },
              icon: Icon(Icons.star,
                  color: widget.rating.rating >= 5 ? Colors.yellow : Colors.grey),
              iconSize: 30),
        ],
      ),
    );
  }
}
