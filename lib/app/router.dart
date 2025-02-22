import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/app_view.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_viewmodel.dart';
import 'package:rickandmorty/views/screens/favourites_view/favourites_view.dart';
import 'package:rickandmorty/views/screens/locations_view/locations_view.dart';
import 'package:rickandmorty/views/screens/secitons_view/sections_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String favourites = '/favourites';
  static const String locations = '/locations';
  static const String sections = '/sections';
  static const String settings = '/settings';

  static const String profileRoute = 'characterProfile';
  static const String characterProfile = '/characterProfile';

  static const String residentsRoute = 'residents';
  static const String residents = '/locations/residents';

  static const String sectionCharactersRoute = 'characters';
  static const String sectionCharacters = '/sections/characters';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.characters,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.characters,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => CharactersViewmodel(),
                child: const CharactersView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favourites,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => CharactersViewmodel(),
                child: const FavouritesView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder: (context, state) => const LocationsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder: (context, state) => const SectionsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
