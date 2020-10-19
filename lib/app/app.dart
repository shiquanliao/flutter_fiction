import 'package:flutter/material.dart';
import 'package:flutter_fiction/app/colors.dart';
import 'package:flutter_fiction/app/root_scene.dart';

final RouteObserver<PageRoute> _routeObserver = RouteObserver<PageRoute>();

class FictionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '随心小说',
      navigatorObservers: [_routeObserver],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: Color(0xffeeeeee),
        scaffoldBackgroundColor: STColors.paper,
        textTheme: TextTheme( bodyText1: TextStyle(color: STColors.darkGray))
      ),
      home: RootScene(),
    );
  }
}
