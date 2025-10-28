import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

extension StaggeredAnimationExtension on Widget {
  Widget animateStaggered(
    int index, {
    bool grid = false,
    int milliseconds = 500,
    int columnCount = 2,
  }) {
    final duration = Duration(milliseconds: milliseconds);

    if (grid) {
      return AnimationConfiguration.staggeredGrid(
        position: index,
        duration: duration,
        columnCount: columnCount,
        child: ScaleAnimation(child: FadeInAnimation(child: this)),
      );
    } else {
      return AnimationConfiguration.staggeredList(
        position: index,
        duration: duration,
        child: ScaleAnimation(child: FadeInAnimation(child: this)),
      );
    }
  }
}

extension StaggeredListExtension on List<Widget> {
  Widget animateStaggeredList({int milliseconds = 500}) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(length, (index) {
          return this[index].animateStaggered(
            index,
            milliseconds: milliseconds,
          );
        }),
      ),
    );
  }
}

extension StaggeredSliverListExtension on List<Widget> {
  SliverList animateStaggeredSliverList({int milliseconds = 500}) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return AnimationLimiter(
          child: this[index].animateStaggered(
            index,
            milliseconds: milliseconds,
          ),
        );
      }, childCount: length),
    );
  }
}
