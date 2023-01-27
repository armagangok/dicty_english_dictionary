// // ignore_for_file: avoid_print

// import '../../../../../global/export/export.dart';

// part 'accent_state.dart';

// class AccentCubit extends Cubit<AccentState> {
//   AccentCubit() : super(AccentInitial());

//   int accent = 0;

//   final localUsecase = getIt.call<LocalWordUsecase>();

//   Future<void> saveAccent(int accent) async {
//     var response = await localUsecase.saveAccent(accent: accent);
//     response.fold(
//       (l) {
//         print("Accent saving state: $l");
//         emit(AccentInitial());
//       },
//       (r) {
//         print("Accent saving state: $r");
//         getAccent();
//         emit(AccentInitial());
//       },
//     );
//   }

//   Future<void> getAccent() async {
//     var response = await localUsecase.getAccent();
//     response.fold(
//       (l) => emit(AccentFetchingError()),
//       (r) {
//         accent = r;
//         emit(AccentInitial());
//       },
//     );
//   }
// }
