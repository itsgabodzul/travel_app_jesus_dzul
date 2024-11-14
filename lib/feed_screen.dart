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
        title: const Text('Travel App'), //Añade el titulo superior a la pagina
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(CupertinoIcons.search), //Añade el icono de busqueda
          ),
          actions: [
            IconButton(
              onPressed: (){},
          icon: const Icon(CupertinoIcons.star), //Añade el icono de estrella
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
          return PlaceCard(
            place: place,
            onPressed: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, animation, __) => FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      body: Text(place.name),
                    ),
                  )
                )
              );
            },);
        },
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //Centra el icono de locacion
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.location_on,
        color: Colors.white),), //Añade el icono de Locacion
      bottomNavigationBar:TravelNavigationBar( //Inserta el codigo de Travel Navigator Bar
        onTap: (index) {},
        items: [
          TravelNavigationBarItem(
            icon: CupertinoIcons.chat_bubble, //Añade el icono de Chat
            selectedIcon: CupertinoIcons.chat_bubble_fill,
          ),
          TravelNavigationBarItem(
            icon: CupertinoIcons.square_split_2x2,  //Añade el icono de Cuadros
            selectedIcon: CupertinoIcons.square_split_2x2_fill,
          ),
        ],
      )
    );
  }
}