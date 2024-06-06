import 'package:dankookcoffee/database/DatabaseHelper.dart';
import 'package:dankookcoffee/models/appbar.dart';
import 'package:dankookcoffee/models/empty_review.dart';
import 'package:dankookcoffee/review/review.dart';
import 'package:dankookcoffee/review/review_edit_page.dart';
import 'package:dankookcoffee/review/tool.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late DatabaseHelper DBHelper;
  List<Review> Review_List = [];
  double rating_avg = 4.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DBHelper = DatabaseHelper();
    _loadReview();
  }

  Future<void> _loadReview() async {
    List<Review> review = await DBHelper.getReviews();
    setState(() {
      Review_List = review;
    });
    print(Review_List);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Container(
        child: Review_List.isEmpty
            ? EmptyReview()
            : Column(
                children: [
                  Container(
                    width: 400,
                    height: 130,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/rev_image2.png'))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8,),
                            Text(
                              "단국 커피",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 35,
                                ),
                                Text(' ${rating_avg}', style: TextStyle(fontSize: 20),)
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${Review_List.length}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 18),
                                ),
                                Text('  reviews')
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: Review_List.length,
                      itemBuilder: (context, index) {
                        final review = Review_List[index];
                        return ListTile(
                          title: Text(review.content),
                          subtitle: Text(review.review_id.toString()),
                          trailing: IconButton(
                              onPressed: () {
                                DBHelper.deleteReview(review.review_id);
                                _loadReview();
                              },
                              icon: Icon(Icons.delete)),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewEditPage(
                                  review_id: Review_List.length)));
                    },
                    child: Container(
                      height: 56,
                      width: 400,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                        child: Text(
                          "Write a review",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
