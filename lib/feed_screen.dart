import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app_jesus_dzul/place.dart';
import 'package:travel_app_jesus_dzul/place_card.dart';
import 'package:travel_app_jesus_dzul/travel_navigation_bar.dart';
import 'package:travel_app_jesus_dzul/place_detail_screen.dart';

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
        itemCount: TravelPlace.place.length, // Número de elementos en la lista
        itemExtent: 350, // Altura fija para cada elemento de la lista
        physics: const BouncingScrollPhysics(), // Comportamiento del desplazamiento
        padding: const EdgeInsets.fromLTRB(20, 0, 20, kToolbarHeight+20),
        itemBuilder: (context, index){
          final place = TravelPlace.place[index];
          return PlaceCard(
            place: place, // Pasa el lugar al widget PlaceCard
            onPressed: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, animation, __) => FadeTransition(
                    opacity: animation,
                    child: PlaceDetailScreen(
                      place: place,
                      screenHeight: MediaQuery.of(context).size.height, // Obtiene la altura de la pantalla
                    ),
                  )
                )
              );
            },);
        },
      ),
      extendBody: true,  // Extiende el cuerpo para evitar traslapes con el FAB
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
            selectedIcon: CupertinoIcons.chat_bubble_fill, // Ícono de chat seleccionado
          ),
          TravelNavigationBarItem(
            icon: CupertinoIcons.square_split_2x2,  //Añade el icono de Cuadros
            selectedIcon: CupertinoIcons.square_split_2x2_fill, // Ícono seleccionado
          ),
        ],
      )
    );
  }
}