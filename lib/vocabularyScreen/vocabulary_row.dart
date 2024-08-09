import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_words/models/word.dart';
import 'package:learning_words/utils.dart/colors.dart';

class VocabularyRow extends StatelessWidget {
  final Word word;
  const VocabularyRow({required this.word, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Column(
        children: [
          Expandable(
            collapsed: ExpandableButton(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 4.0, left: 10.0, right: 10.0),
                child: RowTitle(word: word),
              ),
            ),
            expanded: Column(children: [
              RowExpanded(word: word),
            ]),
          ),
        ],
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  final Word word;
  final bool isOpened;
  const RowTitle({super.key, required this.word, this.isOpened = false});

  @override
  Widget build(BuildContext context) {
    var controller = ExpandableController.of(context, required: true)!;
    return GestureDetector(
      onTap: () => controller.toggle(),
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
                  vertical: BorderSide(color: AppColors.black),
                ),
              ),
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
              quarterTurns: isOpened ? 3 : 1,
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

class RowExpanded extends StatelessWidget {
  final Word word;
  const RowExpanded({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: const BoxDecoration(color: AppColors.grey, boxShadow: [
          BoxShadow(color: AppColors.grey, blurRadius: 10, spreadRadius: 15)
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowTitle(
                word: word,
                isOpened: true,
              ),
              Text(
                word.translation,
                style: const TextStyle(fontSize: 16.0, color: AppColors.black),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                word.examples,
                style: const TextStyle(fontSize: 16.0, color: AppColors.black),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/trash.svg',
                    width: 20.0,
                    height: 20.0,
                    colorFilter: const ColorFilter.mode(
                        AppColors.black, BlendMode.srcIn),
                  ),
                  SvgPicture.asset(
                    'assets/icons/edit.svg',
                    width: 20.0,
                    height: 20.0,
                    colorFilter: const ColorFilter.mode(
                        AppColors.black, BlendMode.srcIn),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
