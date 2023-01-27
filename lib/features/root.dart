import 'package:flutter/material.dart';

import 'home/presentation/cubit/theme/theme_cubit_cubit.dart';
import 'home/presentation/pages/home_page.dart';
import '../global/export/export.dart';
import '../global/injection.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeCubit, ThemeState>(
        bloc: themeCubit,
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          theme: CustomTheme.instance.ligthTheme,
          darkTheme: CustomTheme.instance.darkTheme,
          themeMode: themeCubit.getThemeMode,
          // initialRoute: '/onboard',
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationServiceImp.instance.navigatorKey,
        ),
      );
}
