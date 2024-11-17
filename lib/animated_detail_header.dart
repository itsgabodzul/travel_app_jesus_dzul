import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app_jesus_dzul/gradient_status_tag.dart';
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: (20 + topPadding) * (1- bottomPercent),
                  bottom: 160 * (1- bottomPercent),
                ),
                  child: Transform.scale(
                    scale: lerpDouble(1, 1.3, bottomPercent),
                    child: PlaceImagesPageView(imagesUrl: imagesUrl)
                  ),
              ),
              Positioned(
                top: topPadding,
                left: -60 * (1-bottomPercent),
                child: const BackButton(
                  color: Colors.white,)
              ),
              Positioned(
                top: topPadding,
                right: -60 * (1-bottomPercent),
                child: IconButton(
                  onPressed: (){},
                  color: Colors.white,
                  icon: const Icon(Icons.more_horiz,
                  color: Colors.white),
                  )
              ),
              Positioned(
                top: lerpDouble(-30, 140, topPercent)!.clamp(topPadding + 10, 140),
                left: lerpDouble(60, 20, topPercent)!.clamp(20.0, 50.0),
                right: 20,
                child: AnimatedOpacity(
                  opacity: bottomPercent < 1 ? 0:1,
                  duration: kThemeAnimationDuration,
                  child: Text(
                    place.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: lerpDouble(20, 40, topPercent),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 200,
                child: AnimatedOpacity(
                  opacity: bottomPercent < 1 ? 0:1,
                  duration: kThemeAnimationDuration,
                  child: GradientStatusTag(
                    statusTag: place.statusTag),))
            ],
          ),
        ),
        Positioned.fill(
          top: null,
          bottom: -140 * (1 - topPercent),
          child: TranslateAnimation(child: _LikesAndSharesContainer(place: place)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(color: Colors.white, height: 10),
        ),
        Positioned.fill(
          top: null,
          child: TranslateAnimation(child: _UserInfoContainer(place: place)),
          ),
      ],
    );
  }
}

class TranslateAnimation extends StatelessWidget{
  const TranslateAnimation ({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        builder: (context, value, child){
        return Transform.translate(
        offset: Offset(0, 100 * value),
        child: child,
    );
    },
    child: child,
  );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({
    super.key,
    required this.place,
  });

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30)
        )
      ),
      child: Row(
        children: [
          CircleAvatar(
              backgroundImage: NetworkImage(place.user.urlPhoto), // Se crea una fila que contendra el nombre del usuario y su imagen de perfil
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  place.user.name, //Trae el nombre del usuario
                  style: context.bodyText1
                ),
                Text(
                  'yesterday at 9:10 p.m.', //Agrega un texto justo de bajo del nombre
                  style: context.bodyText1.copyWith(
                    color: Colors.blueGrey
                  )
                ),
              ],
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: context.subtitle1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),

                ),
                ),
                label: const Text('Seguir'), //Agreagamos el icono de me gusta y traemos el valor de la base de datos
            ),
        ],),
      );
  }
}

class _LikesAndSharesContainer extends StatelessWidget {
  const _LikesAndSharesContainer({
    super.key,
    required this.place,
  });

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                icon: const Icon(CupertinoIcons.heart_fill,
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
                icon: const Icon(CupertinoIcons.reply_thick_solid,
                color: Colors.white),
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
                icon: const Icon(Icons.bookmark, size: 26,),
                label: const Text('Agendar'), //Agreagamos el icono de me gusta y traemos el valor de la base de datos
          ),
        ],
      ),
    );
  }
}