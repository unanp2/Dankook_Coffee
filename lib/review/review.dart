class Review {
  final int review_id;
  final int user_id;
  final int store_id;
  final String store_picture_url;
  final int rating;
  final String content;
  final String created_date;
  final String modified_date;

  Review({
    required this.review_id,
    required this.user_id,
    required this.store_id,
    required this.store_picture_url,
    required this.rating,
    required this.content,
    required this.created_date,
    required this.modified_date,
  });

  Map<String, dynamic> toMap() {
    return {
      'review_id': review_id,
      'user_id': user_id,
      'store_id': store_id,
      'store_picture_url': store_picture_url,
      'rating': rating,
      'content': content,
      'created_date': created_date,
      'modified_date': modified_date,
    };
  }
}
