import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_jesus_dzul/text_theme_x.dart';
import 'package:travel_app_jesus_dzul/place.dart';
import 'package:travel_app_jesus_dzul/gradient_status_tag.dart';

class PlaceCard extends StatelessWidget{
  const PlaceCard({
    Key? key,
    required this.place,
    required this.onPressed,
  }) : super(key: key);

  final TravelPlace place;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final statusTag = place.statusTag;
    return InkWell(
      onTap: onPressed,
      child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), //Redondeas la carta
                image: DecorationImage(
                  image: NetworkImage(place.imagesUrl.first), //Obtienes la imagen de la BD y la insertas
                  fit: BoxFit.cover, //Que ocupe todo el espacio
                  colorFilter:const  ColorFilter.mode(
                    Colors.grey, // Se coloca un color por encima y se le agrega un modo de fucion para que no se solido
                    BlendMode.multiply,
                  ),
                  ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                    backgroundImage: NetworkImage(place.user.urlPhoto), // Se crea una fila que contendra el nombre del usuario y su imagen de perfil
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.user.name, //Trae el nombre del usuario
                        style: context.bodyText1.copyWith(
                        color: Colors.white,
                        ),
                      ),
                      Text(
                        'yesterday at 9:10 p.m.', //Agrega un texto justo de bajo del nombre
                        style: context.bodyText1.copyWith(
                        color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton( //agrega un icono de mas a un costado
                    onPressed: (){},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )
                  )
                  ],
                  ),
                  const Spacer(),
                  Text(
                    place.name,
                    style: context.headline2,
                  ),
                  const SizedBox(height: 10),
                  GradientStatusTag(statusTag: statusTag),
                  const Spacer(),
                  Row( // creamos una nuva linea en la parte inferior para otros iconos
                    children: [
                      TextButton.icon(
                        onPressed: () {}, 
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        icon: const Icon(CupertinoIcons.heart),
                        label: Text(place.likes.toString()), //Agreagamos el icono de me gusta y traemos el valor de la base de datos
                        ),
                        TextButton.icon(
                        onPressed: () {}, 
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        icon: const Icon(CupertinoIcons.reply), //agregamos el icono de compartit y traemos el valor de la base de datos
                        label: Text(place.shared.toString()),
                        ),
                    ],
                  )
                ]
              ),
            ),
    );
  }
}