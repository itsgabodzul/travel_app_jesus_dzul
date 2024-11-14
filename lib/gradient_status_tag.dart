import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_jesus_dzul/place.dart';
import 'package:travel_app_jesus_dzul/text_theme_x.dart';


class GradientStatusTag extends StatelessWidget {
  const GradientStatusTag({
    Key? key,
    required this.statusTag,
  }) : super(key: key);

  final StatusTag statusTag;

  @override
  Widget build(BuildContext context) { //Este genera la etique te de event o popular lugar
    String text;
    List<Color> colors;
    switch(statusTag) { // Aqui hace una eleccion segun lo correspondio en la base de datos
      case StatusTag.popular: //Si es StatusTag.popular hara esto, un tag con un gradiente y el texto popular place
      text = 'Popular Place';
      colors = [Colors.amber, Colors.orange.shade600];
      break;
      case StatusTag.event: //Si es StatusTag.event hara esto, un tag con un gradiente y el texto event
      text = 'Event';
      colors = [Colors.cyan, Colors.blue.shade600];
      break;
    }
    return Container( //esta sirve justmane para crear el tag redondeado pues anterior mente se pasan los paramentros para que funcione
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), //Lo redondeas
        gradient: LinearGradient(
          colors: colors
          )
      ),
      child: Text(
        text,
        style: context.subtitle1.copyWith(color: Colors.white), //colocas el color a texto
      ),
    );
  }
}