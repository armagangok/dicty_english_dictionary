import '../model/definition.dart';
import '../model/license.dart';
import '../model/meaning.dart';
import '../model/phonetic.dart';

class WordEntity {
  final String? definition;
  final List<dynamic>? synonyms;
  final List<dynamic>? antonyms;
  final String? example;
  final String? name;
  final String? url;
  final String? partOfSpeech;
  final List<Definition>? definitions;
  final String? word;
  final String? origin;
  final List<Phonetic>? phonetics;
  final List<Meaning>? meanings;
  final License? license;
  final List<dynamic>? sourceUrls;

  const WordEntity({
    this.word,
    this.origin,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
    this.partOfSpeech,
    this.definitions,
    this.name,
    this.url,
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });
}
