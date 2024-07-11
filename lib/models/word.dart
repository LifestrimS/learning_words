class Word {
  final int id;
  final String word;
  final String transcription;
  final String translation;

  Word(
      {required this.id,
      required this.word,
      required this.transcription,
      required this.translation});

  Word.fromJson(Map<String, dynamic> json)
      : id = 0,
        word = json['word'] as String,
        transcription = json['transcription'] as String,
        translation = json['translation'] as String;

  Map<String, dynamic> toJson() => {
        'word': word,
        'transcription': transcription,
        'translation': translation
      };

  @override
  String toString() {
    return '\nid: $id : $word : $transcription : $translation';
  }
}
