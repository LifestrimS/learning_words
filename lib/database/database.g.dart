// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WordsTableTable extends WordsTable
    with TableInfo<$WordsTableTable, WordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transcriptionMeta =
      const VerificationMeta('transcription');
  @override
  late final GeneratedColumn<String> transcription = GeneratedColumn<String>(
      'transcription', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'translation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _examplesMeta =
      const VerificationMeta('examples');
  @override
  late final GeneratedColumn<String> examples = GeneratedColumn<String>(
      'examples', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, word, transcription, translation, examples];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words_table';
  @override
  VerificationContext validateIntegrity(Insertable<WordsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('transcription')) {
      context.handle(
          _transcriptionMeta,
          transcription.isAcceptableOrUnknown(
              data['transcription']!, _transcriptionMeta));
    } else if (isInserting) {
      context.missing(_transcriptionMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('examples')) {
      context.handle(_examplesMeta,
          examples.isAcceptableOrUnknown(data['examples']!, _examplesMeta));
    } else if (isInserting) {
      context.missing(_examplesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      transcription: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transcription'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translation'])!,
      examples: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}examples'])!,
    );
  }

  @override
  $WordsTableTable createAlias(String alias) {
    return $WordsTableTable(attachedDatabase, alias);
  }
}

class WordsTableData extends DataClass implements Insertable<WordsTableData> {
  final int id;
  final String word;
  final String transcription;
  final String translation;
  final String examples;
  const WordsTableData(
      {required this.id,
      required this.word,
      required this.transcription,
      required this.translation,
      required this.examples});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['transcription'] = Variable<String>(transcription);
    map['translation'] = Variable<String>(translation);
    map['examples'] = Variable<String>(examples);
    return map;
  }

  WordsTableCompanion toCompanion(bool nullToAbsent) {
    return WordsTableCompanion(
      id: Value(id),
      word: Value(word),
      transcription: Value(transcription),
      translation: Value(translation),
      examples: Value(examples),
    );
  }

  factory WordsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordsTableData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      transcription: serializer.fromJson<String>(json['transcription']),
      translation: serializer.fromJson<String>(json['translation']),
      examples: serializer.fromJson<String>(json['examples']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'transcription': serializer.toJson<String>(transcription),
      'translation': serializer.toJson<String>(translation),
      'examples': serializer.toJson<String>(examples),
    };
  }

  WordsTableData copyWith(
          {int? id,
          String? word,
          String? transcription,
          String? translation,
          String? examples}) =>
      WordsTableData(
        id: id ?? this.id,
        word: word ?? this.word,
        transcription: transcription ?? this.transcription,
        translation: translation ?? this.translation,
        examples: examples ?? this.examples,
      );
  @override
  String toString() {
    return (StringBuffer('WordsTableData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('transcription: $transcription, ')
          ..write('translation: $translation, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, word, transcription, translation, examples);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordsTableData &&
          other.id == this.id &&
          other.word == this.word &&
          other.transcription == this.transcription &&
          other.translation == this.translation &&
          other.examples == this.examples);
}

class WordsTableCompanion extends UpdateCompanion<WordsTableData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> transcription;
  final Value<String> translation;
  final Value<String> examples;
  const WordsTableCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.transcription = const Value.absent(),
    this.translation = const Value.absent(),
    this.examples = const Value.absent(),
  });
  WordsTableCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required String transcription,
    required String translation,
    required String examples,
  })  : word = Value(word),
        transcription = Value(transcription),
        translation = Value(translation),
        examples = Value(examples);
  static Insertable<WordsTableData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? transcription,
    Expression<String>? translation,
    Expression<String>? examples,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (transcription != null) 'transcription': transcription,
      if (translation != null) 'translation': translation,
      if (examples != null) 'examples': examples,
    });
  }

  WordsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? transcription,
      Value<String>? translation,
      Value<String>? examples}) {
    return WordsTableCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      transcription: transcription ?? this.transcription,
      translation: translation ?? this.translation,
      examples: examples ?? this.examples,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (transcription.present) {
      map['transcription'] = Variable<String>(transcription.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (examples.present) {
      map['examples'] = Variable<String>(examples.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsTableCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('transcription: $transcription, ')
          ..write('translation: $translation, ')
          ..write('examples: $examples')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $WordsTableTable wordsTable = $WordsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wordsTable];
}

typedef $$WordsTableTableInsertCompanionBuilder = WordsTableCompanion Function({
  Value<int> id,
  required String word,
  required String transcription,
  required String translation,
  required String examples,
});
typedef $$WordsTableTableUpdateCompanionBuilder = WordsTableCompanion Function({
  Value<int> id,
  Value<String> word,
  Value<String> transcription,
  Value<String> translation,
  Value<String> examples,
});

class $$WordsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WordsTableTable,
    WordsTableData,
    $$WordsTableTableFilterComposer,
    $$WordsTableTableOrderingComposer,
    $$WordsTableTableProcessedTableManager,
    $$WordsTableTableInsertCompanionBuilder,
    $$WordsTableTableUpdateCompanionBuilder> {
  $$WordsTableTableTableManager(_$AppDatabase db, $WordsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WordsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WordsTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$WordsTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> word = const Value.absent(),
            Value<String> transcription = const Value.absent(),
            Value<String> translation = const Value.absent(),
            Value<String> examples = const Value.absent(),
          }) =>
              WordsTableCompanion(
            id: id,
            word: word,
            transcription: transcription,
            translation: translation,
            examples: examples,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String word,
            required String transcription,
            required String translation,
            required String examples,
          }) =>
              WordsTableCompanion.insert(
            id: id,
            word: word,
            transcription: transcription,
            translation: translation,
            examples: examples,
          ),
        ));
}

class $$WordsTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $WordsTableTable,
    WordsTableData,
    $$WordsTableTableFilterComposer,
    $$WordsTableTableOrderingComposer,
    $$WordsTableTableProcessedTableManager,
    $$WordsTableTableInsertCompanionBuilder,
    $$WordsTableTableUpdateCompanionBuilder> {
  $$WordsTableTableProcessedTableManager(super.$state);
}

class $$WordsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WordsTableTable> {
  $$WordsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get transcription => $state.composableBuilder(
      column: $state.table.transcription,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get translation => $state.composableBuilder(
      column: $state.table.translation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get examples => $state.composableBuilder(
      column: $state.table.examples,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$WordsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WordsTableTable> {
  $$WordsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get transcription => $state.composableBuilder(
      column: $state.table.transcription,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get translation => $state.composableBuilder(
      column: $state.table.translation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get examples => $state.composableBuilder(
      column: $state.table.examples,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$WordsTableTableTableManager get wordsTable =>
      $$WordsTableTableTableManager(_db, _db.wordsTable);
}
