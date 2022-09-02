import 'package:flutter/material.dart';
import 'package:power/providers/pagamentos_provider.dart';
import 'package:power/screens/alunos_details_screen.dart';
import 'package:power/screens/alunos_form_screen.dart';
import 'package:power/screens/alunos_screen.dart';
import 'package:power/screens/alunos_update_form_screen.dart';
import 'package:power/screens/gym_overview_screen.dart';
import 'package:power/screens/pagamentos_form_screen.dart';
import 'package:power/screens/tabs_alunos_details_screen.dart';
import 'package:power/utils/app_routes.dart';
import 'package:provider/provider.dart';

import 'providers/alunos_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AlunosProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PagamentosProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Power',
        theme: ThemeData(
            fontFamily: 'RobotoCondensed',
            //canvasColor: const Color.fromARGB(255, 37, 43, 48),
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: const Color.fromARGB(255, 0, 134, 255),
                  secondary: Colors.red,
                  tertiary: const Color.fromARGB(255, 171, 60, 131),
                ),
            textTheme: ThemeData().textTheme.copyWith(
                headline6: const TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 16,
                    color: Colors.white)),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ))),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Color.fromARGB(255, 7, 50, 87)),
            color: Color.fromARGB(255, 0, 134, 255),
            actionsIconTheme:
                IconThemeData(color: Color.fromARGB(255, 7, 50, 87)),
            titleTextStyle: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: ThemeData().colorScheme.copyWith(
                brightness: Brightness.dark,
                primary: const Color.fromARGB(255, 0, 134, 255),
                secondary: const Color.fromARGB(255, 171, 60, 131),
              ),
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (ctx) => const GymOverviewScreen(),
          AppRoutes.ALUNOS_SCREEN: (ctx) => const AlunosScreen(),
          AppRoutes.ALUNOS_FORM: (ctx) => const AlunosFormScreen(),
          AppRoutes.ALUNOS_DETAILS: (ctx) => const AlunoDetailScreen(),
          AppRoutes.TABS_ALUNOS_DETAILS: (ctx) =>
              const TabsAlunosDetailsScreen(),
          AppRoutes.ALUNOS_UPDATE_FORM_SCREEN: (ctx) =>
              const AlunosUpdateFormScreen(),
          AppRoutes.PAGAMENTOS_FORM_SCREEN: (ctx) =>
              const PagamentosFormScreen(),
        },
      ),
    );
  }
}
