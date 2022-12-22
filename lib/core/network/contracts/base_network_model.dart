import 'package:english_accent_dictionary/data/entity/word_entity.dart';

abstract class BaseNetworkModel<T>  extends WordEntity{
  T fromJson(Map<String, dynamic> json);
}