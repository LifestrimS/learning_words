import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_words/models/word.dart';
import 'package:learning_words/repository/repository.dart';
import 'package:learning_words/utils.dart/colors.dart';

class AddWordDilog {
  final Function(bool value) onConfirm;

  AddWordDilog({
    required this.onConfirm,
  });

  final TextEditingController _textFieldWordController =
      TextEditingController();
  final TextEditingController _textFieldTranscriptionController =
      TextEditingController();
  final TextEditingController _textFieldTranslationController =
      TextEditingController();
  final TextEditingController _textFieldExampleController =
      TextEditingController();

  Future<void> addWordDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textField(
                      controller: _textFieldWordController,
                      hintText: 'Word',
                      height: 50.0,
                      maxLines: 1),
                  textField(
                      controller: _textFieldTranscriptionController,
                      hintText: 'Transcription',
                      height: 50.0,
                      maxLines: 1),
                  textField(
                      controller: _textFieldTranslationController,
                      hintText: 'Translation',
                      height: 100.0,
                      maxLines: 3),
                  textField(
                      controller: _textFieldExampleController,
                      hintText: 'Examples',
                      height: 200.0,
                      maxLines: 6),
                  GestureDetector(
                    onTap: () {
                      onSave().then((value) {
                        if (value) {
                          onConfirm(true);
                          Navigator.pop(context);
                        }
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 60.0 - 12.0),
                      child: const Center(
                        child: Text(
                          'Save',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: AppColors.black, fontSize: 24.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget textField(
      {required TextEditingController controller,
      required String hintText,
      required double height,
      required int maxLines}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.top,
        maxLines: maxLines,
        style: const TextStyle(color: AppColors.black, fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
            hintText: hintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            hintStyle: const TextStyle(color: AppColors.black),
            fillColor: AppColors.white,
            filled: true),
      ),
    );
  }

  Future<bool> onSave() async {
    try {
      Word word = Word(
          id: 0,
          word: _textFieldWordController.text,
          transcription: _textFieldTranscriptionController.text,
          translation: _textFieldTranslationController.text,
          examples: _textFieldExampleController.text);
      await GetIt.I.get<Repository>().addWord(word);
      return true;
    } catch (e) {
      log('Wrong adding word: $e');
      return false;
    }
  }
}
