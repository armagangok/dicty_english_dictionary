import '../../../global/export/export.dart';

abstract class BaseWordController extends GetxController {
  late RxList<Definition> noun;
  late RxList<Definition> verb;
  late RxList<Definition> interjection;
  late RxList<Definition> pronoun;
  late RxList<Definition> articles;
  late RxList<Definition> adverb;
  late RxList<Definition> preposition;
  late RxList<Definition> adjective;
}
