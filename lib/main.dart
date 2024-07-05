import 'package:flutter/material.dart';

import 'utils.dart/custom_shape.dart';
import 'utils.dart/clip_shadow_path.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 130;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipShadowPath(
          clipper: Customshape(),
          shadow: Shadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(1, 4),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.black87),
            height: appBarHeight,
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Learning words',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Learning words',
            ),
          ],
        ),
      ),
    );
  }
}
