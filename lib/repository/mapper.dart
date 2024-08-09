import 'package:drift/drift.dart';
import 'package:learning_words/database/database.dart';
import 'package:learning_words/models/word.dart';

class Mapper {
  Word toWord(WordsTableData element) {
    return Word(
        id: element.id,
        word: element.word,
        transcription: element.transcription,
        translation: element.translation,
        examples: element.examples);
  }

  WordsTableData toWordsTableData(Word word) {
    return WordsTableData(
        id: word.id,
        word: word.word,
        transcription: word.transcription,
        translation: word.translation,
        examples: word.examples);
  }

  WordsTableCompanion toWordsTableCompanion(Word word) {
    return WordsTableCompanion(
        word: Value(word.word),
        transcription: Value(word.transcription),
        translation: Value(word.translation),
        examples: Value(word.examples));
  }
}
