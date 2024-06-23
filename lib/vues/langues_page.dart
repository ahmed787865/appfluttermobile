import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapplangue/bloc/langue_list_bloc.dart';
import 'package:flutterapplangue/repo/global_dis_repo.dart';
import 'package:flutterapplangue/repo/global_local_repo.dart';
import 'package:flutterapplangue/repo/npl_dis_repo.dart';
import 'package:flutterapplangue/vues/connexion_page.dart';
import 'package:flutterapplangue/vues/teachers_page.dart';

class LanguesPage extends StatelessWidget {
  static final String routeName = "/languages";

  const LanguesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LangueListBloc>(
      create: (context) => LangueListBloc(
        globalDisRepo: context.read<GlobalDisRepo>(),
        globalLocalRepo: context.read<GlobalLocalRepo>(),
      )..load(),
      child: _LanguesPage(),
    );
  }
}

class _LanguesPage extends StatelessWidget {
  const _LanguesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("  تطبيق اللغات"),
        actions: [_popMenu(context)],
      ),
      body: BlocBuilder<LangueListBloc, LangueListState>(
        builder: (context, state) {
          if (state.status == LangueListStatus.init) {
            return _init(context, state);
          } else if (state.status == LangueListStatus.loading) {
            return _loading(context, state);
          } else if (state.status == LangueListStatus.fail) {
            return _fail(context, state);
          } else {
            return _done(context, state);
          }
        },
      ),
    );
  }

  Widget _popMenu(BuildContext context) {
    return PopupMenuButton(
        offset: const Offset(0, 50),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Parametre'),
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text(" Deconnexion"),
                onTap: () {
                  context.read<LangueListBloc>().deconnexion();
                  Navigator.pushReplacementNamed(
                      context, ConnexionPage.routeName);
                },
              ),
            ]);
  }

  Widget _init(BuildContext context, LangueListState state) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/word.jpeg",
              ),
              fit: BoxFit.cover)),
    );
  }

  Widget _loading(BuildContext context, LangueListState state) {
    return Center(child: CircularProgressIndicator());
  }

  Widget _fail(BuildContext context, LangueListState state) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 36,
            ),
            SizedBox(
              height: 16,
            ),
            Text('Erreur'),
            SizedBox(
              height: 16,
            ),
            Text(state.message ?? '...'),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<LangueListBloc>().load();
                },
                child: Text('Réessayer'))
          ],
        ),
      ),
    );
  }

  Widget _done(BuildContext context, LangueListState state) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          //leading:
           //   (NplDisRepo.getGlobalUrl("images/${state.data![index].id}.png")),
          title: Text(state.data![index].name!),
          onTap: () {
            Navigator.pushNamed(
              context,
              TeachersPage.routeName,
              arguments: TeacherPageArg(state.data![index].id!),
            );
          },
        );
      },
      itemCount: state.data!.length,
    );
  }
}
