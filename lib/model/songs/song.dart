class Song {
  final String id;
  final String title;
  final String artistId;
  final Duration duration;
  final Uri imageUrl;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.duration,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist id: $artistId, duration: $duration)';
  }
}
