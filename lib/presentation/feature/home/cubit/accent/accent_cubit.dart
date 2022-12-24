// ignore_for_file: avoid_print

import '../../../../../global/export/export.dart';

part 'accent_state.dart';

class AccentCubit extends Cubit<AccentState> {
  AccentCubit() : super(AccentInitial(accentIndex: 4));

  final localUsecase = getIt.call<LocalWordUsecase>();

  // static int initAccent() {}

  Future<void> saveAccent(int accent) async {
    var response = await localUsecase.saveAccent(accent: accent);
    response.fold(
      (l) {
        print("Accent saving state: $l");
      },
      (r) => print("Accent saving state: $r"),
    );
  }

  Future<void> getAccent() async {
    var response = await localUsecase.getAccent();
    response.fold(
      (l) => emit(AccentFetchingError(accentIndex: 0)),
      (r) => emit(AccentInitial(accentIndex: r)),
    );
  }
}
