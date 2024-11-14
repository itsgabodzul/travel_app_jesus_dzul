import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app_jesus_dzul/place.dart';
import 'package:travel_app_jesus_dzul/place_card.dart';
import 'package:travel_app_jesus_dzul/travel_navigation_bar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel App'),
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(CupertinoIcons.search),
          ),
          actions: [
            IconButton(
              onPressed: (){},
          icon: const Icon(CupertinoIcons.star),
            ),
          ],
      ),
      body: ListView.builder(
        itemCount: TravelPlace.place.length,
        itemExtent: 350,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, kToolbarHeight+20),
        itemBuilder: (context, index){
          final place = TravelPlace.place[index];
          return PlaceCard(place: place);
        },
      ),
      extendBody: true,
      bottomNavigationBar:TravelNavigationBar(
        onTap: (index) {},
        items: [
          TravelNavigationBarItem(
            icon: CupertinoIcons.chat_bubble, 
            selectedIcon: CupertinoIcons.chat_bubble_fill,
          ),
          TravelNavigationBarItem(
            icon: CupertinoIcons.square_split_2x2, 
            selectedIcon: CupertinoIcons.square_split_2x2_fill,
          ),
        ],
      )
    );
  }
}