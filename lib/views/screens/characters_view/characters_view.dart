import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_viewmodel.dart';
import 'package:rickandmorty/views/widgets/character_card_listview.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    context.read<CharactersViewmodel>().getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharactersViewmodel>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              _SearchInputWidget(context, viewModel: viewModel),
              viewModel.charactersModel == null
                  ? const CircularProgressIndicator
                      .adaptive() // null ile  else ise aşağı
                  : CharacterCardListview(
                      characters: viewModel.charactersModel!.characters,
                      onLoadMore: () => viewModel.getCharactersMore(),
                      loadMore: viewModel.loadMore,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Padding _SearchInputWidget(BuildContext context,
      {required CharactersViewmodel viewModel}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onFieldSubmitted: viewModel.getCharactersByName,
        decoration: InputDecoration(
            hintText: "Karakteri Ara",
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.onSurface),
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}
