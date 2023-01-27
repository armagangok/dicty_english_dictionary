import '../features/home/presentation/cubit/theme/theme_cubit_cubit.dart';
import 'export/export.dart';

final themeCubit = getIt.call<ThemeCubit>();

final themeService = getIt.call<ThemeService>();
 
// final localWordUsecase= getIt.call<LocalWordUsecase>(); 

// final localWordRepository= getIt.call<LocalWordRepository>(); 