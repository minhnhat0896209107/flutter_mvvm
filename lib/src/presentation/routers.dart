import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/browse/browse.dart';
import 'package:flutter_app/src/presentation/list_note/display_note/display_note.dart';
import 'package:flutter_app/src/presentation/list_note/list_note.dart';
import 'package:flutter_app/src/presentation/list_notebooks/list_notebooks_screen.dart';

import 'navigation/navigation_screen.dart';
import 'presentation.dart';

class Routers {
  static const String navigation = "/navigation";
  static const String browsescreen = "/browse";
  static const String listnote = "/list_note";
  static const String listnotebook = "/list_notebooks";
  static const String setting = "/setting";
  static const String display = "/display_note";
  static const String float_button = "/float_button";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case navigation:
        return animRoute(NavigationScreen(), name: navigation);
      case browsescreen:
        return animRoute(BrowseScreen(),
            name: browsescreen, beginOffset: _left);
      case listnote:
        return animRoute(ListNoteScreen(), name: listnote, beginOffset: _right);
      case listnotebook:
        return animRoute(ListNoteBooks(),
            name: listnotebook, beginOffset: _right);
      case setting:
        return animRoute(SettingScreen(), name: setting, beginOffset: _top);
      case display:
        return animRoute(DisplayNote(), name: display, beginOffset: _bottom);
      case float_button:
        return animRoute(FloatButtonScreen(),
            name: float_button, beginOffset: _bottom);
      default:
        return animRoute(
            Container(
                child: Center(
                    child: Text('No route defined for ${settings.name}'))),
            name: "/error");
    }
  }

  static Route animRoute(Widget page,
      {Offset? beginOffset, required String name, Object? arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name, arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = beginOffset ?? Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Offset _center = Offset(0.0, 0.0);
  static Offset _top = Offset(0.0, 1.0);
  static Offset _bottom = Offset(0.0, -1.0);
  static Offset _left = Offset(-1.0, 0.0);
  static Offset _right = Offset(1.0, 0.0);
}
