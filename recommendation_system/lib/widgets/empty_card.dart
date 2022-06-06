import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  final double? width;
  final double? height;
  final String moviename;
  final Color tileColor;
  final Color textColor;

  const EmptyCard({
    Key? key,
    this.width,
    this.height,
    required this.moviename,
    required this.tileColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      child: Center(
        child: Text(
          moviename,
          style: TextStyle(fontSize: 25.0, color: textColor),
        ),
      ),
    );
  }
}
