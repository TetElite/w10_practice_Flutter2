import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final String baseHost = 'test-a2a77-default-rtdb.asia-southeast1.firebasedatabase.app';

  late final Uri songsUri = Uri.https(baseHost, '/songs.json');

  List<Song>? _cachedSongs;

  @override
  Future<List<Song>> fetchSongs({bool forceFetch = false}) async {
    if (!forceFetch && _cachedSongs != null) {
      return _cachedSongs!;
    }
    final songs = await _fetchSongsFromApi();
    _cachedSongs = songs;
    return songs;
  }

  Future<List<Song>> _fetchSongsFromApi() async {
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      List<Song> result = [];
      for (final entry in songJson.entries) {
        result.add(SongDto.fromJson(entry.key, entry.value));
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {}

  @override
  Future<Song> likeSong(Song song) async {
    final uri = Uri.https(baseHost, '/songs/${song.id}/likes.json');
    final response = await http.put(
      uri,
      body: json.encode(song.likes + 1),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      final updatedSong = song.copyWith(likes: song.likes + 1);

      if (_cachedSongs != null) {
        _cachedSongs = _cachedSongs!.map((s) {
          return s.id == song.id ? updatedSong : s;
        }).toList();
      }

      return updatedSong;
    } else {
      throw Exception('Failed to like song ${song.id}');
    }
  }
}
