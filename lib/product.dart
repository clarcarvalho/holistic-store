class Product {
  final String id;
  final String name;
  final double price;
  final String? description;
  final String imageUrl;
  final int stars;
  final List<String> imageUrls;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      this.description,
      required this.imageUrl,
      required this.stars,
      required this.imageUrls});
}
