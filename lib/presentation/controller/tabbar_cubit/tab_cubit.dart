import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabInitial(index: 0));

  changeIndex(newIndex) {
    emit(ChangeIndex(index: newIndex));
  }
}
