import 'package:english_accent_dictionary/feature/export/export.dart';

import '../models/definition.dart';

abstract class XController extends GetxController {
  RxList<Definition>? noun;
  RxList<Definition>? verb;
  RxList<Definition>? interjection;
  RxList<Definition>? pronoun;
  RxList<Definition>? articles;
  RxList<Definition>? adverb;
  RxList<Definition>? preposition;
  RxList<Definition>? adjective;
}
