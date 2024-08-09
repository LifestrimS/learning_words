import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_words/utils.dart/colors.dart';
import 'package:learning_words/vocabularyScreen/vocabulary_screen.dart';

class VocabularyWidget extends StatelessWidget {
  const VocabularyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.black),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(16.0),
        ),
        boxShadow: [AppColors.containerShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => onVocabularyTap(context),
            child: Container(
              clipBehavior: Clip.none,
              height: 58.0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 9.0),
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14.0),
                  bottomLeft: Radius.circular(16.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Vocabulary',
                    style: TextStyle(
                      color: AppColors.white,
                      height: 0,
                      fontSize: 32.0,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/triangle.svg',
                    height: 24.0,
                    width: 24.0,
                    clipBehavior: Clip.antiAlias,
                    colorFilter: const ColorFilter.mode(
                        AppColors.white, BlendMode.srcIn),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          const WordLine(),
          const WordLine(),
          devider(),
          const WordLine(),
          const WordLine(),
          const SizedBox(
            height: 6.0,
          ),
        ],
      ),
    );
  }

  void onVocabularyTap(BuildContext context) {
    log('Go to vocabulary');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VocabularyScreen(),
      ),
    );
  }

  Widget devider() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 48.0),
          height: 1.0,
          color: AppColors.black,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 13.0),
          height: 1.0,
          color: AppColors.black,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 48.0),
          height: 1.0,
          color: AppColors.black,
        ),
      ],
    );
  }
}

class WordLine extends StatelessWidget {
  const WordLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Row(
        children: [
          const Text(
            'Word',
            style: TextStyle(fontSize: 24.0, color: AppColors.black),
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/tick.svg',
            height: 20.0,
            width: 20.0,
          ),
          const SizedBox(
            width: 5.0,
          ),
          const Text(
            '50%',
            style: TextStyle(fontSize: 16.0, color: AppColors.black),
          )
        ],
      ),
    );
  }
}
