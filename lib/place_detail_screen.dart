import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app_jesus_dzul/place.dart';
import 'package:travel_app_jesus_dzul/animated_detail_header.dart';
import 'package:travel_app_jesus_dzul/text_theme_x.dart';


class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place, // Recibe el objeto place que contiene la información del lugar.
    required this.screenHeight,
  }) : super(key: key);

  final TravelPlace place;
  final double screenHeight;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late ScrollController _controller; // Controlador para gestionar el desplazamiento de la vista.
  @override
  void initState(){
    _controller = 
    ScrollController(initialScrollOffset: widget.screenHeight * .3); // Inicializa el controlador de desplazamiento, comenzando desde un desplazamiento de 30% de la altura de la pantalla
    super.initState();
  }
  @override
  void dispose(){
    _controller.dispose();  // Desmonta el controlador cuando ya no se necesita.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), // Física de rebote para el desplazamiento.
        controller: _controller, // Asocia el controlador al CustomScrollView.
        slivers: [
          SliverPersistentHeader(
            delegate: BuilderPersistentDelegate(
              maxExtent: MediaQuery
              .of(context)
              .size
              .height, // Establece la altura máxima de la cabecera.
              minExtent: 240, // Establece la altura mínima de la cabecera.
              builder: (percent) {
                return AnimatedDetailHeader( // Pasa la información del lugar a la cabecera.
                  topPercent: ((1-percent) / .7).clamp(0.0, 1.0), //"percent" representa el porcentaje de desplazamiento actual
                  bottomPercent: (percent / .3).clamp(0.0, 1.0),
                  place:widget.place);
              }
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.black26), // Icono de ubicación.
                      Flexible(
                        child: Text(
                          widget.place.locationDesc, // Descripción de la ubicación del lugar.
                          style: context.bodyText1.copyWith(color: Colors.blue),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // Agrega puntos suspensivos si el texto es muy largo.
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(widget.place.description), // Muestra la descripción del lugar.
                  const SizedBox(height: 10,),
                  Text(widget.place.description),
                  const SizedBox(height: 10,),
                  Text(widget.place.description),
                ],
              ),
            )
            ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 100,
            //     child: ListView.builder(
            //       itemCount: TravelPlace.collectionPlace.length,
            //       itemBuilder: (context, index){
            //         final collectionPlace = TravelPlace.collectionPlace[index];
            //         return Image.network(
            //           collectionPlace.imagesUrl.first,
            //         );
            //       }),
            //   ),
            // )
        ],
      ),
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate{

  BuilderPersistentDelegate({
    required double maxExtent, // Altura máxima del sliver.
    required double minExtent, // Altura mínima del sliver.
    required this.builder // Función que construye el contenido del sliver. 
  }) : _maxExtent = maxExtent,
      _minExtent = minExtent;

final double _maxExtent;
final double _minExtent;
final Widget Function(double percent) builder; 

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) { //shrinkOffset - Es un valor que representa la cantidad de desplazamiento que ha ocurrido desde el inicio de la vista
  // overlapsContent - Indica si el encabezado persistente está sobreponiéndose al contenido
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent; // Devuelve la altura máxima del sliver

  @override
  double get minExtent => _minExtent; // // Devuelve la altura mínima del sliver.

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false; // No es necesario reconstruir el sliver cuando el estado cambia
}