import 'package:flutter/material.dart';

import '../global/export/export.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  final _themeCubit = getIt.call<ThemeCubit>();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: _themeCubit,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomeView(),
          theme: CustomTheme.instance.ligthTheme,
          darkTheme: CustomTheme.instance.darkTheme,
          themeMode: _themeCubit.getThemeMode,
          // initialRoute: '/onboard',
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationServiceImp.instance.navigatorKey,
        );
      },
    );
  }
}
