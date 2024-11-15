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
            itemCount: imagesUrl.length,
            physics: const BouncingScrollPhysics(),
            controller: PageController(viewportFraction: 1),
            itemBuilder: (context, index) {
              final imageUrl = imagesUrl[index];
              return Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.multiply,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imagesUrl.length,
            (index) => Container(
              color: Colors.black,
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
