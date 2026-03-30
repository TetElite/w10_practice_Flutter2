import '../../../model/artist/artist.dart';
 

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtists();
  
  Future<Artist?> fetchArtistById(String id);
}
