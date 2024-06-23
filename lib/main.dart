import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapplangue/repo/global_dis_repo.dart';
import 'package:flutterapplangue/repo/global_local_repo.dart';
import 'package:flutterapplangue/vues/connexion_page.dart';
import 'package:flutterapplangue/vues/langues_page.dart';
import 'package:flutterapplangue/vues/teachers_page.dart';
import 'package:flutterapplangue/vues/user_create_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GlobalDisRepo>(
            create: (context) => GlobalDisRepo()
        ),
        RepositoryProvider<GlobalLocalRepo>(
            create: (context) => GlobalLocalRepo()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: ConnexionPage.routeName,
        routes: {
          ConnexionPage.routeName : (context) =>  ConnexionPage(),
          UserCreatePage.routeName : (context) => UserCreatePage(),
          LanguesPage.routeName : (context) => LanguesPage(),
          TeachersPage.routeName : (context) => TeachersPage(),
        }
      ),
    );
  }
}

