import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app_jesus_dzul/text_theme_x.dart';
import 'package:travel_app_jesus_dzul/place.dart';
import 'package:travel_app_jesus_dzul/place_images_page_view.dart';


class AnimatedDetailHeader extends StatelessWidget {
  const AnimatedDetailHeader({
    Key? key,
    required this.place,
    required this.topPercent,
    required this.bottomPercent,
  }) : super(key: key);

  final TravelPlace place;
  final double topPercent;
  final double bottomPercent;

  @override
  Widget build(BuildContext context) {
    final topPadding =  MediaQuery.of(context).padding.top;
    final imagesUrl = place.imagesUrl;
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRect(
          child: Padding(
            padding: EdgeInsets.only(
              top: (20 + topPadding) * (1- bottomPercent),
              bottom: 160 * (1- bottomPercent),
            ),
              child: Transform.scale(
                scale: lerpDouble(1, 1.3, bottomPercent),
                child: PlaceImagesPageView(imagesUrl: imagesUrl)
              ),
          ),
        ),
        Positioned.fill(
          top: null,
          child: Container(
            height: 140,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30)
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {}, 
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: context.subtitle1,
                    shape: const StadiumBorder(),
                    ),
                      icon: const Icon(CupertinoIcons.heart,
                      color: Colors.red,),
                      label: Text(place.likes.toString()), //Agreagamos el icono de me gusta y traemos el valor de la base de datos
                ),
                TextButton.icon(
                  onPressed: () {}, 
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: context.subtitle1,
                    shape: const StadiumBorder(),
                    ),
                      icon: const Icon(CupertinoIcons.reply),
                      label: Text(place.shared.toString()), //Agreagamos el icono de me gusta y traemos el valor de la base de datos
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {}, 
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    textStyle: context.subtitle1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    ),
                      icon: const Icon(Icons.check_circle_outlined, size: 26,),
                      label: const Text('Agendar'), //Agreagamos el icono de me gusta y traemos el valor de la base de datos
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30)
              )
            ),
          ),
        )
      ],
    );
  }
}