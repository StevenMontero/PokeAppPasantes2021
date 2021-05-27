import 'package:fluro/fluro.dart';
import 'package:poke_app/ui/HomePage/PokenmonListView/pokemons_view.dart';
import 'package:poke_app/ui/HomePage/TrainerView/trainer_view.dart';
import 'package:poke_app/ui/NotFoundPage/no_page_found_view.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String pokemonsRoute = '/pokemons';
  static String trainersRoute = '/trainers';

  static Handler _pokemonsHandler =
      Handler(handlerFunc: (context, parameters) => PokemonGridViewPage());
  static Handler _trainersHandler =
      Handler(handlerFunc: (context, parameters) => TrainerPage());
  static Handler _notFoundHandler =
      Handler(handlerFunc: (context, parameters) => NoPageFoundPage());
  static void setupRouter() {
    router.define(rootRoute,
        handler: _pokemonsHandler, transitionType: TransitionType.none);
    router.define(pokemonsRoute,
        handler: _pokemonsHandler, transitionType: TransitionType.fadeIn);
    router.define(trainersRoute,
        handler: _trainersHandler, transitionType: TransitionType.fadeIn);
    router.notFoundHandler = _notFoundHandler;
  }
}
