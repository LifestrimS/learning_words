import 'dart:convert';
import 'dart:developer';

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
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
      body: ValueListenableBuilder(
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
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: fab(),
    );
  }

  updateDBByJson(BuildContext context) async {
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
        //Temporary button
        GestureDetector(
          onTap: _onRefresh,
          child: SvgPicture.asset(
            'assets/icons/edit.svg',
            width: 32.0,
            height: 32.0,
            colorFilter: const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
          ),
        ),
        const PopUpMenu()
      ],
    );
  }

  Widget fab() {
    return ExpandableFab(
      //key: _key,
      type: ExpandableFabType.up,
      childrenAnimation: ExpandableFabAnimation.none,
      distance: 70,
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.white.withOpacity(0.9),
      ),
      closeButtonBuilder: FloatingActionButtonBuilder(
        size: 30.0,
        builder: (context, onPressed, progress) => Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
            ),
          ),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: SvgPicture.asset(
              'assets/icons/add.svg',
              height: 20.0,
              width: 20.0,
            ),
          ),
        ),
      ),
      openButtonBuilder: FloatingActionButtonBuilder(
        size: 60.0,
        builder: (context, onPressed, progress) => Container(
          padding: const EdgeInsets.all(14.0),
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
          ),
          child: SvgPicture.asset(
            'assets/icons/add.svg',
            height: 32.0,
            width: 32.0,
          ),
        ),
      ),
      children: [
        Row(
          children: [
            const Text('by hand'),
            const SizedBox(width: 20),
            FloatingActionButton.small(
              heroTag: null,
              onPressed: () {
                updateDBByJson(context);
              },
              backgroundColor: AppColors.grey,
              child: SvgPicture.asset(
                'assets/icons/add.svg',
                height: 18.0,
                width: 18.0,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text('by JSON'),
            const SizedBox(width: 20),
            FloatingActionButton.small(
              heroTag: null,
              onPressed: null,
              backgroundColor: AppColors.grey,
              child: SvgPicture.asset(
                'assets/icons/add.svg',
                height: 18.0,
                width: 18.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
