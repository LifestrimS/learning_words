import 'package:drift/drift.dart';

class WordsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text().named('word')();
  TextColumn get transcription => text().named('transcription')();
  TextColumn get translation => text().named('translation')();
  TextColumn get examples => text().named('examples')();
}
