import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlaceImagesPageView extends StatelessWidget {
  final List<String> imagesUrl; // Define imagesUrl como un parámetro

  const PlaceImagesPageView({
    Key? key,
    required this.imagesUrl, // Requiere imagesUrl como argumento
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: imagesUrl.length, //Definimos el numero de imagenes
            physics: const BouncingScrollPhysics(), // Le damos un efecto de rebote al desplazamiento
            controller: PageController(viewportFraction: 1),
            itemBuilder: (context, index) {
              final imageUrl = imagesUrl[index];  // Obtenemos la URL de la imagen actual
              return Container(
                margin: const EdgeInsets.only(left: 10, right: 10), //Margen a las imagenes
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black, //Sombra al widget
                      blurRadius: 10, //Redondeo de las imagenes
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl), // Cargamos la imagen desde la URL
                    fit: BoxFit.cover, //Ocupa toda la pantalla
                    colorFilter: const ColorFilter.mode(
                      Colors.grey, //Filtro
                      BlendMode.multiply,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row( //Crea un "indicador de pagina" para las imagenes
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imagesUrl.length, // Crea un punto por cada imagen
            (index) => Container(
              color: Colors.black, // El color de los puntos es negro
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 3,
              width: 10,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
