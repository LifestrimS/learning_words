import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning_words/database/database.dart';
import 'package:learning_words/home_page.dart';
import 'package:learning_words/models/word.dart';
import 'package:learning_words/repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();
  final repo = Repository(db);

  await repo.addWord(Word(
      id: 0,
      word: 'word',
      transcription: 'transcription',
      translation: 'translation'));

  List<Word> allItems = await repo.getAllWords();

  for (Word item in allItems) {
    log('${item.id} : ${item.word}\n');
  }

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning words',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
