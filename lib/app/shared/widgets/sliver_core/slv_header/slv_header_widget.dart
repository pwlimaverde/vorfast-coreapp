import 'package:flutter/material.dart';
import 'dart:math' as math;

class SlvHeaderWidget extends StatelessWidget {
  final String title;
  final Color color;

  const SlvHeaderWidget({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return makeHeader(title: title, color: color);
  }

  SliverPersistentHeader makeHeader({String title, Color color}) {
    return SliverPersistentHeader(
      pinned: false,
      delegate: _SliverAppBarDelegate(
        minHeight: 50.0,
        maxHeight: 250.0,
        child: Container(
            color: color ?? Colors.white, child: Center(child: Text(title))),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
