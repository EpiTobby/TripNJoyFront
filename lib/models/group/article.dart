class Article {
  Article({
    required this.id,
    required this.name,
    required this.price,
    this.participants = const [],
  });

  final int id;
  final String name;
  final double price;
  final List<int> participants;
}
