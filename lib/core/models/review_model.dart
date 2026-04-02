import 'package:tager/core/entity/review_entity.dart';

class ReviewModel {
  final String image, name, date, reviewDescription;
  final num rating;

  ReviewModel({
    required this.image,
    required this.name,
    required this.date,
    required this.reviewDescription,
    required this.rating,
  });
  // convert object of type ReviewEntitiy to ReviewModel
  factory ReviewModel.fromEntity(ReviewEntitiy reviewEntitiy) {
    return ReviewModel(
      image: reviewEntitiy.image,
      name: reviewEntitiy.name,
      date: reviewEntitiy.date,
      reviewDescription: reviewEntitiy.reviewDescription,
      rating: reviewEntitiy.rating,
    );
  }
  // convert the map in firebase to object
  factory ReviewModel.fromjson(json) {
    return ReviewModel(
      image: json['image'],
      name: json['name'],
      date: json['date'],
      reviewDescription: json['reviewDescription'],
      rating: json['rating'],
    );
  }

  // convert the model to entity to use it in the ui
  ReviewEntitiy toEntity() {
    return ReviewEntitiy(
      image: image,
      name: name,
      date: date,
      reviewDescription: reviewDescription,
      rating: rating,
    );
  }

  // convert the object in ui  to   map to add to firebase firestore
  toMap() {
    return {
      'image': image,
      'name': name,
      'date': date,
      'reviewDescription': reviewDescription,
      'rating': rating,
    };
  }
}
