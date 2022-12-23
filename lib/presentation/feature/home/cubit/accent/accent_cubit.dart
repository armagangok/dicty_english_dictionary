import '../../../../../global/export/export.dart';

part 'accent_state.dart';

class AccentCubit extends Cubit<AccentState> {
  AccentCubit() : super(AccentInitial(accent: 0));

  final localUsecase = getIt.call<LocalWordUsecase>();

  // void onInit() async {
  //   var response = await localUsecase.getAccent();

  //   response.fold(
  //     (failure) {
  //       LogHelper.shared.debugPrint("$failure");
  //       emit(AccentFetchingError());
  //     },
  //     (data) {
  //       print(data);
  //       emit(AccentFetched(accent: data));
  //     },
  //   );
  // }

  Future<void> saveAccent(int accent) async {
    var response = await localUsecase.saveAccent(accent: accent);
    response.fold(
      (l) {
        LogHelper.shared.debugPrint("Accent saving state: $l");
      },
      (r) => LogHelper.shared.debugPrint("Accent saving state: $r"),
    );
  }

  Future<void> getAccent() async {
    var response = await localUsecase.getAccent();

    response.fold(
      (l) => emit(AccentFetchingError(accent: 0)),
      (r) => emit(AccentFetched(accent: r)),
    );
  }
}
