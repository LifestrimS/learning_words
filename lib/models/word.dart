class Word {
  final int id;
  final String word;
  final String transcription;
  final String translation;
  final String examples;

  Word(
      {required this.id,
      required this.word,
      required this.transcription,
      required this.translation,
      required this.examples});

  Word.fromJson(Map<String, dynamic> json)
      : id = 0,
        word = json['word'] as String,
        transcription = json['transcription'] as String,
        translation = json['translation'] as String,
        examples = json['examples'] as String;

  Map<String, dynamic> toJson() => {
        'word': word,
        'transcription': transcription,
        'translation': translation,
        'examples': examples
      };

  @override
  String toString() {
    return '\nid: $id : $word : $transcription : $translation : $examples';
  }

  @override
  bool operator ==(Object other) {
    return (other is Word) &&
        other.word == word &&
        other.transcription == transcription;
  }

  @override
  int get hashCode => Object.hash(word, transcription);
}
