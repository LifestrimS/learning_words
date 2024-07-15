import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_words/mainScreen/game_widget.dart';
import 'package:learning_words/mainScreen/vocabulary_widget.dart';
import 'package:learning_words/models/word.dart';
import 'package:learning_words/repository/repository.dart';
import 'package:learning_words/utils.dart/appbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Learning words',
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
