
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/teacher_list_bloc.dart';
import '../repo/global_dis_repo.dart';
import '../repo/npl_dis_repo.dart';

class TeacherPageArg{
  final String langueId;
  TeacherPageArg(this.langueId);
}

class TeachersPage extends StatelessWidget {
  static final  String routeName ="/teachers";

  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    TeacherPageArg arg = ModalRoute.of(context)!.settings.arguments as TeacherPageArg;
    return BlocProvider<TeacherListBloc>(
      create: (context)=>TeacherListBloc(
          globalDisRepo: context.read<GlobalDisRepo>(),
          langueId: arg.langueId,
      )..load(),
      child: _TeachersPage() ,
    );
  }
}


class _TeachersPage extends StatelessWidget {
  const _TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listes des enseignants"),
        actions: [
        ],
      ),
      body: BlocBuilder<TeacherListBloc,TeacherListState>(
        builder: (context,state){
          if(state.status == TeacherListStatus.init){
            return _init(context,state);
          } else if(state.status == TeacherListStatus.loading){
            return _loading(context,state);
          } else if(state.status == TeacherListStatus.fail){
            return _fail(context, state);
          }else {
            return _done(context, state);
          }
        },
      ),
    //  backgroundColor: Colors.purple,
    );
  }



  Widget _init(BuildContext context,TeacherListState state){
    return Container();
  }

  Widget _loading(BuildContext context,TeacherListState state){
    return Center(
        child: CircularProgressIndicator()
    );
  }

  Widget _fail(BuildContext context,TeacherListState state){
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Erreur'),
            SizedBox(height: 16,),
            Text(state.message??'...'),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: (){
                context.read<TeacherListBloc>().load();
              },
              child: Text('Réessayer')
            )
          ],
        ),
      ),
    );
  }

  Widget _done(BuildContext context,TeacherListState state){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(state.data![index].name!),
          subtitle: Text(state.data![index].phone!),
          trailing: Text("${state.data![index].joined}"),
         // onTap: (){
           // Navigator.pushNamed(
             // context,
              //TeachersPage.routeName,
              //arguments: TeacherPageArg(state.data![index].id!  ),
            //);

        //  },
        );
      },
      itemCount: state.data!.length,
    );
  }
}
