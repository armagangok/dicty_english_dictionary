import 'package:bloc/bloc.dart';

part 'recent_search_state.dart';

class RecentSearchCubit extends Cubit<RecentSearchState> {
  RecentSearchCubit() : super(RecentSearchInitial());
}
