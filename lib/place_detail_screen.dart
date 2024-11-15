import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app_jesus_dzul/place.dart';
import 'package:travel_app_jesus_dzul/animated_detail_header.dart';


class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
                  place:place);
              }
            ),
          ),
          const SliverToBoxAdapter(child: Placeholder()),
          const SliverToBoxAdapter(child: Placeholder()),
          const SliverToBoxAdapter(child: Placeholder()),

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