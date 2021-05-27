import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/router/navigation_key.dart';
import 'package:poke_app/router/routes.dart';
import 'package:poke_app/ui/Shared/SideBar/side_item.dart';
import 'package:poke_app/ui/theme/colors_const.dart';

class SideMenu extends StatelessWidget {
  const SideMenu() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: bgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/pokecenter.png",
                    width: 46,
                  ),
                  _titleSideBar(),
                  Spacer()
                ],
              ),
              SizedBox(height: kDefaultPadding),
              // Menu Items
              DrawerMenuItem(
                onPress: () => navigateTo(Flurorouter.trainersRoute),
                title: "Entrenadores",
                icon: "assets/Icons/player.svg",
                isActive: true,
              ),
              DrawerMenuItem(
                onPress: () => navigateTo(Flurorouter.pokemonsRoute),
                title: "Pokemons",
                icon: "assets/Icons/pokeballs.svg",
                isActive: true,
              ),

              SizedBox(height: kDefaultPadding * 2),
            ],
          ),
        ),
      ),
    );
  }

  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
  }

  Widget _titleSideBar() {
    return Container(
        padding: EdgeInsets.only(top: 30),
        child: Text(
          'Poke App',
          style: GoogleFonts.pressStart2p(
              fontSize: 15, fontWeight: FontWeight.w200, color: primaryColor),
        ));
  }
}
