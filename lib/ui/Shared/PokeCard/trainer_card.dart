import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WhiteCardTrainer extends StatelessWidget {
  final String title;
  final double? width;
  final Function() onPressEdit;
  final Function() onPressDelete;
  const WhiteCardTrainer({
    Key? key,
    required this.title,
    this.width,
    required this.onPressEdit,
    required this.onPressDelete,
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
            child: WebsafeSvg.asset('assets/icons/player.svg'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('Editar'),
                      ]),
                  onPressed: onPressEdit,
                ),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                  child: Row(children: [
                    Icon(
                      Icons.delete,
                      size: 20,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Eliminar'),
                  ]),
                  onPressed: onPressDelete,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
