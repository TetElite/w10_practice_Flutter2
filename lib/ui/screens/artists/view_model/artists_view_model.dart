import 'package:flutter/material.dart';
import '../../../../data/repositories/artist/artist_repository.dart';
import '../../../../model/artist/artist.dart';
import '../../../utils/async_value.dart';

class ArtistsViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;

  AsyncValue<List<Artist>> artistsValue = AsyncValue.loading();

  ArtistsViewModel({required this.artistRepository}) {
    _init();
  }

  void _init() async {
    fetchArtists();
  }

  void fetchArtists() async {
    // 1- Loading state
    artistsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<Artist> artists = await artistRepository.fetchArtists();
      artistsValue = AsyncValue.success(artists);
    } catch (e) {
      // 3- Fetch is unsucessfull
      artistsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
