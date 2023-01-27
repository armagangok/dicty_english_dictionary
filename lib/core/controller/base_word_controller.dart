import '../../data/models/response/response_data/meanings/definitions/definitions.dart';

abstract class WordCubitContract {
  List<Definitions> noun = [];
  List<Definitions> verb = [];
  List<Definitions> interjection = [];
  List<Definitions> pronoun = [];
  List<Definitions> articles = [];
  List<Definitions> adverb = [];
  List<Definitions> preposition = [];
  List<Definitions> adjective = [];
}
