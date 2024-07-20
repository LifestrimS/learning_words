import 'package:drift/drift.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:learning_words/database/words_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DriftDatabase(tables: [WordsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<WordsTableData>> get getAllWords => select(wordsTable).get();

  Future<List<WordsTableData>> getWordById(int id) =>
      (select(wordsTable)..where((a) => a.id.equals(id))).get();

  Future<int> addWord(WordsTableCompanion item) =>
      into(wordsTable).insert(item, mode: InsertMode.replace);

  Future<void> updateWord(WordsTableData item) =>
      (update(wordsTable)..where((t) => t.id.equals(item.id))).write(item);

  Future deleteWordById(int id) =>
      (delete(wordsTable)..where((t) => t.id.equals(id))).go();

  Future deleteAllWords() => (delete(wordsTable)).go();

  Future ifExist(String word) =>
      managers.wordsTable.filter((f) => f.word(word)).exists();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
