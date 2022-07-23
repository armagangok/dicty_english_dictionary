import '../../../../feature/export/export.dart';



abstract class BaseWordController extends GetxController {
  RxList<Definition>? noun;
  RxList<Definition>? verb;
  RxList<Definition>? interjection;
  RxList<Definition>? pronoun;
  RxList<Definition>? articles;
  RxList<Definition>? adverb;
  RxList<Definition>? preposition;
  RxList<Definition>? adjective;
}
