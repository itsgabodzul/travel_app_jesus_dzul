import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app_jesus_dzul/place.dart';
import 'package:travel_app_jesus_dzul/animated_detail_header.dart';
import 'package:travel_app_jesus_dzul/text_theme_x.dart';


class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place,
    required this.screenHeight,
  }) : super(key: key);

  final TravelPlace place;
  final double screenHeight;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late ScrollController _controller;
  @override
  void initState(){
    _controller = 
    ScrollController(initialScrollOffset: widget.screenHeight * .3);
    super.initState();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        slivers: [
          SliverPersistentHeader(
            delegate: BuilderPersistentDelegate(
              maxExtent: MediaQuery
              .of(context)
              .size
              .height,
              minExtent: 240,
              builder: (percent) {
                return AnimatedDetailHeader(
                  topPercent: ((1-percent) / .7).clamp(0.0, 1.0),
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
                      const Icon(Icons.location_on, color: Colors.black26),
                      Flexible(
                        child: Text(
                          widget.place.locationDesc,
                          style: context.bodyText1.copyWith(color: Colors.blue),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(widget.place.description),
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
    required double maxExtent,
    required double minExtent, 
    required this.builder
  }) : _maxExtent = maxExtent,
      _minExtent = minExtent;

final double _maxExtent;
final double _minExtent;
final Widget Function(double percent) builder; 

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}