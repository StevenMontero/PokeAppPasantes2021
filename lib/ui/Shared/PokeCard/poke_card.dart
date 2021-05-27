import 'package:flutter/material.dart';
import 'package:poke_app/ui/theme/colors_const.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WhiteCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double? width;
  final Function() onPress;
  const WhiteCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onPress,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: WebsafeSvg.asset('assets/icons/mystic.svg',
                height: 20, width: 20),
            title: Text(title),
          ),
          Expanded(
            child: Image.network(imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 16.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor
                  ),
                  onPressed: onPress,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: WebsafeSvg.asset('assets/icons/pokeball.svg',
                            height: 14, width: 14),
                      ),
                      Text('Capturar'),
                      SizedBox(width: 10.0,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
