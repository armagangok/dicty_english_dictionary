import '../../data/models/response/response_data/meaning/definitions/definition.dart';

abstract class WordCubitContract {
  List<Definition> noun = [];
  List<Definition> verb = [];
  List<Definition> interjection = [];
  List<Definition> pronoun = [];
  List<Definition> articles = [];
  List<Definition> adverb = [];
  List<Definition> preposition = [];
  List<Definition> adjective = [];
}
