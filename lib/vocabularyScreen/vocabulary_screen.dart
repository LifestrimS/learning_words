import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_words/models/word.dart';
import 'package:learning_words/repository/repository.dart';
import 'package:learning_words/utils.dart/appbar.dart';
import 'package:learning_words/utils.dart/colors.dart';
import 'package:learning_words/vocabularyScreen/menu_button.dart';
import 'package:learning_words/vocabularyScreen/vocabulary_row.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  List<Word> wordList = [];
  ValueNotifier listLoaded = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Vocabulary',
        showReturnButton: true,
        action: appBarButtons(),
      ),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ValueListenableBuilder(
          valueListenable: listLoaded,
          builder: (context, value, child) {
            if (value) {
              if (wordList.isNotEmpty) {
                return ListView.builder(
                  itemCount: wordList.length,
                  itemBuilder: (context, index) {
                    return VocabularyRow(word: wordList[index]);
                  },
                );
              }
              return const Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Center(
                  child: Text('Empty :('),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.black,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          updateDBByJson(context);
        },
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              'assets/icons/add.svg',
              height: 32.0,
              width: 32.0,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateDBByJson(BuildContext context) async {
    log('updateByJson');
    listLoaded.value = false;
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/words.json");
    final jsonResult = jsonDecode(data);

    final repo = GetIt.I.get<Repository>();
    for (dynamic jWord in jsonResult) {
      final word = Word.fromJson(jWord);
      if (wordList.contains(word)) {
        repo.updateWord(word);
      } else {
        repo.addWord(word);
      }
    }
    _loadData();
  }

  Future<void> _loadData() async {
    log('loadData');
    listLoaded.value = false;
    await Future.delayed(const Duration(seconds: 1));

    wordList.clear();

    final repo = GetIt.I.get<Repository>();

    final tmpList = await repo.getAllWords();

    wordList.addAll(tmpList);

    listLoaded.value = true;
  }

  void _onRefresh() async {
    log('onRefresh');
    await _loadData();
  }

  Widget appBarButtons() {
    return Row(
      children: [
        GestureDetector(
          onTap: _onRefresh,
          child: SvgPicture.asset(
            'assets/icons/edit.svg',
            width: 32.0,
            height: 32.0,
            colorFilter:
                const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
        const PopUpMenu()
      ],
    );
  }
}
