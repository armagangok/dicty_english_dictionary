// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../model/definition.dart';
import '../model/license.dart';
import '../model/meaning.dart';
import '../model/phonetic.dart';

class WordEntity {
  String? definition;
  String? example;
  String? name;
  String? url;
  String? partOfSpeech;
  String? word;
  String? origin;
  License? license;
  List<Definition>? definitions;
  List<dynamic>? synonyms;
  List<dynamic>? antonyms;
  List<Phonetic>? phonetics;
  List<Meaning>? meanings;
  List<dynamic>? sourceUrls;

  bool isSelected;

  WordEntity({
    this.definition = "",
    this.example = "",
    this.name = "",
    this.url = "",
    this.partOfSpeech = "",
    this.word = "",
    this.origin = "",
    this.license,
    this.definitions = const [],
    this.synonyms = const [],
    this.antonyms = const [],
    this.phonetics = const [],
    this.meanings = const [],
    this.sourceUrls = const [],
    this.isSelected = false,
  });
}
