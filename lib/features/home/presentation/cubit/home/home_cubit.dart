import '../../../../../global/export/export.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  // final ratingHelper = RatingHelper.shared;
  Future<void> requestRate() async {
    emit(RateRequested());
    try {
      // await ratingHelper.requestReview();
      emit(RateSucceded());
    } catch (e) {
      emit(RateFailed());
    }
  }
}
