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
                margin: const EdgeInsets.only(bottom: 20), //Crea un espacio inferior para que las tarjetas no se unan
                padding: const EdgeInsets.all(16), //Margin de la tarjeta
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), //Redondeas la carta
                  image: DecorationImage(
                    image: NetworkImage(place.imagesUrl.first), //Obtienes la imagen de la BD y la insertas
                    fit: BoxFit.cover, //Que ocupe todo el espacio
                    colorFilter:const  ColorFilter.mode(
                      Colors.grey, // Se coloca un color por encima
                      BlendMode.multiply, //se le agrega un modo de fucion para que no sea solido
                    ),
                    ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos hacia la izquierda.
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                      backgroundImage: NetworkImage(place.user.urlPhoto), // Muestra la foto de perfil del usuario en un avatar circular.
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos hacia la izquierda.
                      children: [
                        Text(
                          place.user.name, //Trae el nombre del usuario
                          style: context.bodyText1.copyWith(
                          color: Colors.white,
                          ),
                        ),
                        Text(
                          'yesterday at 9:10 p.m.', //Agrega un texto de bajo del nombre
                          style: context.bodyText1.copyWith(
                          color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton( //agrega un icono de "más" a un costado
                      onPressed: (){},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      )
                    )
                    ],
                    ),
                    const Spacer(), // Espaciado flexible
                    Text(
                      place.name,
                      style: context.headline2, // Aplica un estilo de encabezado.
                    ),
                    const SizedBox(height: 10), // Espaciado vertical entre el nombre y el tag.
                    GradientStatusTag(statusTag: statusTag), // Muestra una etiqueta dinámica degradada
                    const Spacer(),
                    Row( // creamos una nuva linea en la parte inferior para otros iconos
                      children: [
                        TextButton.icon(
                          onPressed: () {}, 
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(), // Botón con bordes redondeados.
                          ),
                          icon: const Icon(CupertinoIcons.heart), //Agreagamos el icono de me gusta
                          label: Text(place.likes.toString()),  // Traemos el valor de la base de datos
                          ),
                          TextButton.icon(
                          onPressed: () {}, 
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          icon: const Icon(CupertinoIcons.reply), //Agregamos el icono de compartit y traemos el valor de la base de datos
                          label: Text(place.shared.toString()),// Traemos el valor de la base de datos
                          ),
                      ],
                    )
                  ]
                ),
              ),
      );
    }
  }