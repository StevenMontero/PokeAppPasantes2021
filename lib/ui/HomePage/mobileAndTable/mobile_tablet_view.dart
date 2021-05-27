import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_app/ui/HomePage/cubit/loadpokemon_cubit.dart';
import 'package:poke_app/ui/Responsive/ResponsiveApp.dart';

import 'package:poke_app/ui/Shared/SideBar/drawer_sidebar.dart';
import 'package:poke_app/ui/theme/colors_const.dart';

class MobileTabletView extends StatelessWidget {
  MobileTabletView(this.widgetGridPokemons) : super();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget widgetGridPokemons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Responsive.isMobile(context)
          ? ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SideMenu(),
            )
          : null,
      appBar: Responsive.isMobile(context)
          ? AppBar(
              leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState!.openDrawer()),
              title: Text('Poke App'),
              backgroundColor: primaryColor,
            )
          : null,
      body: Container(
        color: Colors.white,
        child: BlocBuilder<PokemonCubit, PokemonState>(
          buildWhen: (previous, current) => previous.state != current.state,
          builder: (context, state) {
            return state.state == StateLoadApi.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Responsive.isMobile(context)
                    ? widgetGridPokemons
                    : buildTabletView();
          },
        ),
      ),
    );
  }

  Row buildTabletView() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: SideMenu(),
        ),
        Expanded(
          flex: 9,
          child: widgetGridPokemons,
        ),
      ],
    );
  }
}
