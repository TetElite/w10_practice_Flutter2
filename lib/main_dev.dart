import 'package:provider/provider.dart';
 
import 'data/repositories/artist/artist_repository.dart';
import 'data/repositories/artist/artist_repository_firebase.dart';
import 'data/repositories/songs/song_repository_firebase.dart';
import 'main_common.dart';
import 'data/repositories/settings/app_settings_repository_mock.dart';
import 'data/repositories/songs/song_repository.dart';
import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
List<InheritedProvider> get devProviders {
  final appSettingsRepository = AppSettingsRepositoryMock();

  return [
 
    // 1 - Inject repositories
    Provider<SongRepository>(create: (_) => SongRepositoryFirebase()),
    Provider<ArtistRepository>(create: (_) => ArtistRepositoryFirebase()),
    
    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
      create: (_) => AppSettingsState(repository: appSettingsRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
