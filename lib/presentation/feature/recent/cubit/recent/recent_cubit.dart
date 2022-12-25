import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recent_state.dart';

class RecentCubit extends Cubit<RecentState> {
  RecentCubit() : super(RecentInitial());

    bool _isEditting = false;
  bool _isExtended = true;
  final List<bool> _choosenItemList = [];

  bool get isEditting => _isEditting;
  bool get isExtended => _isExtended;
  List<bool> get choosenItemList => _choosenItemList;

  void edit() {
    _isEditting = !_isEditting;
    emit(RecentInitial());
  }

  void extend() {
    _isExtended = !_isExtended;
    emit(RecentInitial());
  }
}
