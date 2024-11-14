import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app_jesus_dzul/place.dart';


class AnimatedDetailHeader extends StatelessWidget {
  const AnimatedDetailHeader({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    var imagesUrl = place.imagesUrl;
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: place.imagesUrl.length,
            itemBuilder: (context, index){
            final imageUrl = imagesUrl[index];
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.multiply)
                )

              ),
            );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:List.generate(
            imagesUrl.length,
            (index) => Container(
              color: Colors.black,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 3,
              width: 10,
            )
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}