import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/ui/HomePage/cubit/loadpokemon_cubit.dart';
import 'package:poke_app/ui/Responsive/ResponsiveApp.dart';
import 'package:poke_app/ui/Shared/PokeCard/poke_card.dart';
import 'package:poke_app/ui/theme/colors_const.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PokemonGridViewPage extends StatelessWidget {
  PokemonGridViewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
        buildWhen: (previous, current) => previous.state != current.state,
        builder: (context, state) {
          return GridView.count(
            crossAxisCount: Responsive.isMobile(context)
                ? 2
                : Responsive.isDesktop(context)
                    ? 5
                    : 3,
            children: List.generate(state.listPokemons.length, (index) {
              return WhiteCard(
                title: state.listPokemons[index].name,
                imageUrl: state.listPokemons[index].urlImage,
                onPress: () => {
                  context
                      .read<PokemonCubit>()
                      .capturedPokemon(state.listPokemons[index]),
                  _showDialog(context)
                },
              );
            }),
          );
        });
  }

  _showDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      barrierDismissible: true,
      builder: (contex) => SimpleDialog(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30.0, right: 60.0, left: 60.0),
            color: Colors.white,
            child: WebsafeSvg.asset(
              "assets/icons/pokeball.svg",
              height: 110.0,
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              '¡Pokemon capturado!',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 23.0,
                fontWeight: FontWeight.w600,
                fontFamily: "Gotik",
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, right: 8.0, top: 10),
            child: Container(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                  color: primaryColor,
                  textColor: Colors.white,
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text('Listo')),
            ),
          )
        ],
      ),
    );
  }
}
