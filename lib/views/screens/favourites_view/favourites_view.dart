import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/favourites_view/favoutites_viewmodel.dart';
import 'package:rickandmorty/views/widgets/character_card_listview.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  void initState() {
    super.initState();
    context.read<FavouritesViewmodel>().getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavouritesViewmodel>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: viewModel.characters.isEmpty
              ? const CircularProgressIndicator.adaptive()
              : Column(
                  children: [
                    CharacterCardListview(characters: viewModel.characters),
                  ],
                ),
        ),
      ),
    );
  }
}
