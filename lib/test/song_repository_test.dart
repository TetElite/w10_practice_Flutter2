import '../data/repositories/songs/song_repository.dart';
import '../data/repositories/songs/song_repository_firebase.dart';
import '../model/songs/song.dart';

void main() async {
  //   Instantiate the  song_repository_mock
  SongRepository songRepository = SongRepositoryFirebase();

  List<Song> songs = await songRepository.fetchSongs();

  for (var song in songs) {
    print(song);
  }
}
