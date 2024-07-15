import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_words/mainScreen/game_widget.dart';
import 'package:learning_words/mainScreen/vocabulary_widget.dart';
import 'package:learning_words/models/word.dart';
import 'package:learning_words/repository/repository.dart';
import 'package:learning_words/utils.dart/clip_shadow_path.dart';
import 'package:learning_words/utils.dart/colors.dart';
import 'package:learning_words/utils.dart/custom_shape.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 130;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipShadowPath(
          clipper: Customshape(),
          shadow: AppColors.appBarShadow,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: AppColors.black),
            height: appBarHeight,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Learning words',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: onMenuTap,
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                      width: 32.0,
                      height: 32.0,
                      colorFilter: const ColorFilter.mode(
                          AppColors.white, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        ///Approximately hieght of drawed appbar part + padding
        padding:
            const EdgeInsets.only(top: 98.0 + 30.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const VocabularyWidget(),
              const SizedBox(
                height: 29.0,
              ),
              GameWidget(name: 'Write', onTap: () {}),
              GameWidget(name: 'Choose', onTap: () {}),
              GameWidget(name: 'Mix', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  void testSomeFun(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/words.json");
    final jsonResult = jsonDecode(data);

    final repo = GetIt.I.get<Repository>();
    for (dynamic jWord in jsonResult) {
      final word = Word.fromJson(jWord);
      repo.addWord(word);
    }
  }

  void printDb() async {
    final words = await GetIt.I.get<Repository>().getAllWords();
    log('Ttest: words in db: $words');
  }

  void deleteAll() {
    GetIt.I.get<Repository>().deleteAllWords();
  }

  void onMenuTap() {
    log('Ttest: onMenuTap');
  }
}
