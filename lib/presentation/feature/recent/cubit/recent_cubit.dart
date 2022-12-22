import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recent_state.dart';

class RecentCubit extends Cubit<RecentState> {
  RecentCubit() : super(RecentInitial());
}
