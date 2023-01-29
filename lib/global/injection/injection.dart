import 'package:english_accent_dictionary/global/export/export.dart';



class Injection {
  Injection._();

  static NavigationService get navigator => getIt.call<NavigationServiceImp>();

  static ThemeCubit get themeCubit => getIt.call<ThemeCubit>();

  static SearchCubit get searchCubit => getIt.call<SearchCubit>();

  static WordOfTheDayCubit get wordOfTheDayCubit =>
      getIt.call<WordOfTheDayCubit>();

  static TabCubit get tabCubit => getIt.call<TabCubit>();

  static HomeCubit get homeCubit => getIt.call<HomeCubit>();

  static LocalCubit get localCubit => getIt.call<LocalCubit>();

  static RecentCubit get recentCubit => getIt.call<RecentCubit>();
}
