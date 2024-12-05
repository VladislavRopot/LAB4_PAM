class Barbershop {
  final String id;
  final String title;
  final String distance;
  final double rating;
  final String imageUrl;
  final bool isRecommended;

  Barbershop({
    required this.id,
    required this.title,
    required this.distance,
    required this.rating,
    required this.imageUrl,
    this.isRecommended = false,
  });
}
