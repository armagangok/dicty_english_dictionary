import '../../../../../global/export/export.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ratingHelper = RatingHelper.shared;
  Future<void> rateApp() async {
    emit(RateRequested());

    try {
      await ratingHelper.requestReview();
      RateSucceded();
    } catch (e) {
      emit(RateFailed());
    }
  }
}
