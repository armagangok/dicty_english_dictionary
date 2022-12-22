part of 'tab_cubit.dart';

abstract class TabState {
  late int index ;

  TabState({required this.index});
}

class TabInitial extends TabState {
  TabInitial({required int index}) : super(index: index);
}

class ChangeIndex extends TabState {
  ChangeIndex({required int index}) : super(index: index);
}
