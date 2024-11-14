import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_jesus_dzul/text_theme_x.dart';
import 'package:travel_app_jesus_dzul/place.dart';
import 'package:travel_app_jesus_dzul/gradient_status_tag.dart';

class PlaceCard extends StatelessWidget{
  const PlaceCard({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    final statusTag = place.statusTag;
    return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(place.imagesUrl.first),
                fit: BoxFit.cover,
                colorFilter:const  ColorFilter.mode(
                  Colors.grey,
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
                  backgroundImage: NetworkImage(place.user.urlPhoto),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.user.name,
                      style: context.bodyText1.copyWith(
                      color: Colors.white,
                      ),
                    ),
                    Text(
                      'yesterday at 9:10 p.m.',
                      style: context.bodyText1.copyWith(
                      color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
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
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {}, 
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      icon: const Icon(CupertinoIcons.heart),
                      label: Text(place.likes.toString()),
                      ),
                      TextButton.icon(
                      onPressed: () {}, 
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      icon: const Icon(CupertinoIcons.reply),
                      label: Text(place.shared.toString()),
                      ),
                  ],
                )
              ]
            ),
          );
  }
}