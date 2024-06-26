import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/helpers/bloc_observer.dart';
import 'core/helpers/dio_helper.dart';
import 'core/helpers/hive_helper.dart';
import 'core/router/router.dart';
import 'core/theme/theme.dart';
import 'view/register/choose_role_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
    path: 'assets/translation',
    supportedLocales: const [
      Locale('ar', 'EG'),
    ],
    fallbackLocale: const Locale('ar', 'EG'),
    startLocale: const Locale('ar', 'EG'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elmadrasah',
      theme: lightTheme(context),
      home: const ChooseRoleView(),
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
