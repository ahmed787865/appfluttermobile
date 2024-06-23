
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapplangue/bloc/user_create_bloc.dart';
import 'package:flutterapplangue/models/user.dart';
import 'package:flutterapplangue/repo/global_dis_repo.dart';
import 'package:flutterapplangue/vues/langues_page.dart';

class UserCreatePage extends StatelessWidget {
  
  static final  String routeName ="";

  const UserCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCreateBloc>(
        create: (context) => UserCreateBloc(
          globalDisRepo: context.read<GlobalDisRepo>()
        ),
      child: _UserCreatePage(),
    );
  }
}

class _UserCreatePage extends StatefulWidget {
  const _UserCreatePage({super.key});

  @override
  State<_UserCreatePage> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<_UserCreatePage> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _phoneController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau utilisateur'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 32,),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: 'Name'
                ),
              ),
              SizedBox(height: 16,),
              TextField(
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: 'Phone Number'
                ),
              ),
              SizedBox(height: 16,),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
              SizedBox(height: 16,),
              BlocListener<UserCreateBloc,UserCreateState>(
                listener: (context,state){
                  if(state.status){
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context,LanguesPage.routeName);
                  }
                },
                child: ElevatedButton(
                  onPressed: (){
                    User user = User(
                      name: _nameController.text,
                      phone: _phoneController.text,
                      password: _passwordController.text,
                    );
                    context.read<UserCreateBloc>().save(user);
                  },
                  child: Text('Creer')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

