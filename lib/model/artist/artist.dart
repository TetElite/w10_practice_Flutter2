class Artist {
  final String id;
  final String name;
  final String genre;
  final Uri imageUrl;

  Artist({
    required this.id,
    required this.name,
    required this.genre,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Song(id: $id, name: $name, genre: $genre, genre: $genre)';
  }
}
