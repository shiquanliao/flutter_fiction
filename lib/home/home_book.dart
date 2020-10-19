import 'package:flutter_fiction/public.dart';
import 'package:flutter/material.dart';

class HomeBook extends StatefulWidget {
  @override
  _HomeBookState createState() => _HomeBookState();
}

class _HomeBookState extends State<HomeBook> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            Text("测试1"),
            Text("测试2"),
            Text("测试3"),
            Text("测试4"),
          ],
        ),
      ),
    );
  }
}
