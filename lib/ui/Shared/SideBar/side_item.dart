import 'package:flutter/material.dart';
import 'package:poke_app/ui/theme/colors_const.dart';
import 'package:websafe_svg/websafe_svg.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({
    this.isActive = false,
    this.isHover = false,
    this.showBorder = true,
    required this.icon,
    required this.title,
    required this.onPress,
  }) : super();

  final bool isActive, isHover, showBorder;
  final String icon, title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: onPress,
        child: Row(
          children: [
            (isActive || isHover)
                ? WebsafeSvg.asset(
                    "assets/Icons/Angleright.svg",
                    width: 15,
                  )
                : SizedBox(width: 15),
            SizedBox(width: kDefaultPadding / 4),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      icon,
                      height: 20,
                    ),
                    SizedBox(width: kDefaultPadding * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color:
                                (isActive || isHover) ? textColor : grayColor,
                          ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
