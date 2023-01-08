import 'package:flutter/material.dart';

import '../global/export/export.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeCubit, ThemeState>(
        bloc: getIt.call<ThemeCubit>(),
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          theme: CustomTheme.instance.ligthTheme,
          darkTheme: CustomTheme.instance.darkTheme,
          themeMode: getIt.call<ThemeCubit>().getThemeMode,
          // initialRoute: '/onboard',
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationServiceImp.instance.navigatorKey,
        ),
      );
}
