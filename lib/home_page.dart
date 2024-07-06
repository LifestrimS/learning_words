import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_words/utils.dart/clip_shadow_path.dart';
import 'package:learning_words/utils.dart/custom_shape.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Learning words',
            ),
            GestureDetector(
              onTap: () async {
                String data = await DefaultAssetBundle.of(context)
                    .loadString("assets/words.json");
                final jsonResult = jsonDecode(data);
                log('TTest: json: $jsonResult');
              },
              child: Container(
                height: 30.0,
                width: 100.0,
                color: Colors.amber,
                child: const Center(child: Text('Read json')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
