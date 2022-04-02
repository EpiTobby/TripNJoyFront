import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';

class StandardCard extends StatelessWidget {
  const StandardCard(
      {Key? key,
      required this.child,
      this.title,
      this.subtitle,
      this.color = CColors.primary,
      this.backgroundColor = CardColors.white,
      this.shadowColor})
      : super(key: key);
  final Widget? child;
  final String? title;
  final String? subtitle;
  final Color color;
  final Color backgroundColor;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FractionallySizedBox(
        alignment: Alignment.topCenter,
        widthFactor: 1,
        heightFactor: 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: shadowColor != null ? shadowColor! : backgroundColor.withOpacity(0.5),
                blurRadius: 30,
                spreadRadius: -10,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 20.0, left: 10.0, right: 10.0),
            child: Column(children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Text(
                    title!.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 34,
                      height: 0.8,
                      fontWeight: FontWeight.w800,
                      color: color,
                    ),
                  ),
                ),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: color,
                    ),
                  ),
                ),
              if (child != null) Expanded(child: child!)
            ]),
          ),
        ),
      ),
    );
  }
}
