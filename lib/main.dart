import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/router/navigation_key.dart';
import 'package:poke_app/router/routes.dart';
import 'package:poke_app/ui/HomePage/cubit/loadpokemon_cubit.dart';
import 'package:poke_app/ui/HomePage/home_page.dart';

void main() async {
  Flurorouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PokemonCubit()..loadPokemon(100, 0),
        child: MaterialApp(
          title: 'PokeApp',
          onGenerateRoute: Flurorouter.router.generator,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          navigatorKey: NavigationService.navigatorKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (_, child) {
            return HomePage(child!);
          },
        ));
  }
}
