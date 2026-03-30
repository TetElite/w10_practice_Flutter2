import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/artist/artist_repository.dart';
import 'view_model/artists_view_model.dart';
import 'widgets/artists_content.dart';


class ArtistsScreen extends StatelessWidget {
  const ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArtistsViewModel(
        artistRepository: context.read<ArtistRepository>(),
      ),
      child: ArtistsContent(),
    );
  }
}
