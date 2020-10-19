import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiction/app/user_manager.dart';
import 'package:flutter_fiction/global.dart';
import 'package:flutter_fiction/home/home_book.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_fiction/public.dart';

class RootScene extends StatefulWidget {
  @override
  _RootSceneState createState() => _RootSceneState();
}

class _RootSceneState extends State<RootScene> {
  int _tabIndex = 1;
  bool isFinishSetup = false;

  List<Image> _tabImages = [
    Image.asset('img/tab_bookshelf_n.png'),
    Image.asset('img/tab_bookstore_n.png'),
    Image.asset('img/tab_me_n.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('img/tab_bookshelf_p.png'),
    Image.asset('img/tab_bookstore_p.png'),
    Image.asset('img/tab_me_p.png'),
  ];

  @override
  void initState() {
    super.initState();

    setupApp();

    eventBus.on(EventUserLogin, (arg) {
      setState(() {});
    });

    eventBus.on(EventUserLogout, (arg) {
      setState(() {});
    });

    eventBus.on(EventToggleTabBarIndex, (arg) {
      setState(() {
        _tabIndex = arg;
      });
    });
  }

  @override
  void dispose() {
    eventBus.off(EventUserLogin);
    eventBus.off(EventUserLogout);
    eventBus.off(EventToggleTabBarIndex);
    super.dispose();
  }

  void setupApp() async {
    preference = await SharedPreferences.getInstance();
    setState(() {
      isFinishSetup = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isFinishSetup) {
      return Container();
    }

    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          Text('书架'),
          HomeBook(),
          Text('我的'),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: STColors.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), label: '书架'),
          BottomNavigationBarItem(icon: getTabIcon(1), label: '书城'),
          BottomNavigationBarItem(icon: getTabIcon(2), label: '我的'),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
