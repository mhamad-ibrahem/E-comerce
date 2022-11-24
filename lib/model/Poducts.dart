class PopularProducts {
  final String id;
  final String image;
  PopularProducts({required this.id, required this.image});
}

class Product {
  final String oldid;
  final double rate;
  final String name, description;
  final List<String> images;
  Product({
    required this.oldid,
    required this.rate,
    required this.name,
    required this.description,
    required this.images,
  });
}
