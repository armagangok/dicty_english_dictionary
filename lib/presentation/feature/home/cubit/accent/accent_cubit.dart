import '../../../../../global/export/export.dart';

part 'accent_state.dart';

class AccentCubit extends Cubit<AccentState> {
  AccentCubit() : super(AccentInitial()) {
    onInit();
  }

  final localUsecase = getIt.call<LocalWordUsecase>();

  void onInit() async {
    var response = await localUsecase.getAccent();

    response.fold(
      (failure) {
        LogHelper.shared.debugPrint("$failure");
        emit(AccentFetchingError());
      },
      (data) {
        emit(AccentFetched(accent: data));
      },
    );
  }

  void _fetchAccent(accent) {
    emit(AccentFetched(accent: accent));
  }

  Future<void> saveAccent(int accent) async {
    var response = await localUsecase.saveAccent(accent: accent);
    response.fold(
      (l) => print(l),
      (r) => _fetchAccent(accent),
    );
  }
}
