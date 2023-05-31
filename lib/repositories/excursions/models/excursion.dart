class ExcursionItem {
  const ExcursionItem(
      {required this.id, required this.title, required this.photos});

  final String id;
  final String title;
  final List<String> photos;
}

class ExcursionOpen {
  final String id;
  final String title;
  final String description;
  final List<String> photos;

  const ExcursionOpen(this.id, this.title, this.description, this.photos);
}
