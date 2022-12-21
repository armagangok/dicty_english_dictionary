import 'package:english_accent_dictionary/data/entity/word_entity.dart';

import '../../../../global/export/export.dart';

abstract class BaseWordController {
  List<WordEntity> noun = [];
  late List<WordEntity> verb = [];
  late List<WordEntity> interjection = [];
  late List<WordEntity> pronoun = [];
  late List<WordEntity> articles = [];
  late List<WordEntity> adverb = [];
  late List<WordEntity> preposition = [];
  late List<WordEntity> adjective = [];
}
