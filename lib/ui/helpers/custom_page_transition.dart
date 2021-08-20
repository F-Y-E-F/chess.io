import 'package:flutter/material.dart';

enum PageTransitions { SLIDE, SCALE, FADE }

class CustomPageTransition extends PageRouteBuilder {
  @override
  Duration get transitionDuration => super.transitionDuration;
  final Widget page;
  final PageTransitions transitionType;
  final bool isLeft;
  final dynamic settingsArgs;

  @override
  // TODO: implement settings
  RouteSettings get settings => RouteSettings(arguments: this.settingsArgs);

  CustomPageTransition(
      {required this.page,
      this.transitionType = PageTransitions.SLIDE,
      this.isLeft = true,
      this.settingsArgs})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              if (transitionType == PageTransitions.SCALE) {
                return ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: child,
                );
              } else if (transitionType == PageTransitions.SLIDE) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: !isLeft ? const Offset(-1, 0) : const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              } else {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }
            });
}
