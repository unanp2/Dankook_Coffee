import 'package:dankookcoffee/database/DatabaseHelper.dart';
import 'package:dankookcoffee/models/appbar.dart';
import 'package:dankookcoffee/models/empty_review.dart';
import 'package:dankookcoffee/review/review.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late DatabaseHelper DBHelper;
  List<Review> Review_List = [];
  Review r1 = Review(
      review_id: 1,
      user_id: 1,
      store_id: 1,
      store_picture_url: '',
      rating: 1,
      content: 'content',
      created_date: '',
      modified_date: '');

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
            : ListView.builder(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DBHelper.insertReview(r1);
          _loadReview();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
