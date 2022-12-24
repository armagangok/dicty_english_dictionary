import 'package:flutter/material.dart';

import '../global/export/export.dart';
import 'feature/home/cubit/theme/theme_cubit_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
