import 'package:learning_words/database/database.dart';
import 'package:learning_words/models/word.dart';
import 'package:learning_words/repository/mapper.dart';

class Repository {
  final AppDatabase _db;

  Repository(this._db);

  Future<Word> getWordById(int id) async {
    List<WordsTableData> word = await _db.getWordById(id);
    return Mapper().toWord(word[0]);
  }

  Future<List<Word>> getAllWords() async {
    List<WordsTableData> dbList = await _db.getAllWords;
    List<Word> words = [];
    for (var element in dbList) {
      words.add(Mapper().toWord(element));
    }
    return words;
  }

  Future<int> addWord(Word word) async {
    return await _db.addWord(Mapper().toWordsTableCompanion(word));
  }

  Future<void> updateWord(Word item) async {
    return await _db.updateWord(Mapper().toWordsTableData(item));
  }

  Future<void> deleteWordbyId(int id) async {
    return await _db.deleteWordById(id);
  }

  Future<void> deleteAllWords() async {
    return await _db.deleteAllWords();
  }

  Future<bool> ifExist(String word) async {
    return await _db.ifExist(word);
  }
}
