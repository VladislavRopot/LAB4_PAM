import '../../domain/entities/barbershop.dart';

class BarbershopModel extends Barbershop {
  BarbershopModel({
    required String id,
    required String title,
    required String distance,
    required double rating,
    required String imageUrl,
    bool isRecommended = false,
  }) : super(
          id: id,
          title: title,
          distance: distance,
          rating: rating,
          imageUrl: imageUrl,
          isRecommended: isRecommended,
        );

  factory BarbershopModel.fromJson(Map<String, dynamic> json) {
    return BarbershopModel(
      id: json['id'],
      title: json['title'],
      distance: json['distance'],
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'],
      isRecommended: json['isRecommended'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'distance': distance,
      'rating': rating,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
    };
  }
}
