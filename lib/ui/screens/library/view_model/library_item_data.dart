import '../../../../model/artist/artist.dart';
import '../../../../model/songs/song.dart';

class LibraryItemData {
  final Song song;
  final Artist  artist;

  LibraryItemData({required this.song, required this.artist});
}
