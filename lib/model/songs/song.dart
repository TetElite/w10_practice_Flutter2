class Song {
  final String id;
  final String title;
  final String artistId;
  final Duration duration;
  final Uri imageUrl;
  final int likes;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.duration,
    required this.imageUrl,
    required this.likes,
  });

  Song copyWith({int? likes}) => Song(
        id: id,
        title: title,
        artistId: artistId,
        duration: duration,
        imageUrl: imageUrl,
        likes: likes ?? this.likes,
      );

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist id: $artistId, duration: $duration, likes: $likes)';
  }
}
