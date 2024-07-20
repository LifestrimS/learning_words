import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_words/models/word.dart';
import 'package:learning_words/utils.dart/colors.dart';

class VocabularyRow extends StatelessWidget {
  final Word word;
  const VocabularyRow({required this.word, super.key});

  @override
  Widget build(BuildContext context) {
    log('Vocabulary row');
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              word.word,
              style: const TextStyle(fontSize: 24.0, color: AppColors.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      vertical: BorderSide(color: AppColors.black))),
              child: Text(
                word.transcription,
                style: const TextStyle(fontSize: 18.0, color: AppColors.black),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              word.translation,
              maxLines: 1,
              style: const TextStyle(fontSize: 18.0, color: AppColors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 2.0),
            child: RotatedBox(
              quarterTurns: 1,
              child: SvgPicture.asset(
                'assets/icons/triangle.svg',
                width: 12.0,
                height: 12.0,
                colorFilter:
                    const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              ),
            ),
          )
        ],
      ),
    );
  }
}
