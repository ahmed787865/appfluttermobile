import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapplangue/bloc/login_bloc.dart';
import 'package:flutterapplangue/repo/global_dis_repo.dart';
import 'package:flutterapplangue/repo/global_local_repo.dart';
import 'package:flutterapplangue/vues/langues_page.dart';
import 'package:flutterapplangue/vues/user_create_page.dart';
import 'package:flutterapplangue/widgets/app_button.dart';

class ConnexionPage extends StatelessWidget {
  static final String routeName = "/connexion";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
          globalDisRepo: context.read<GlobalDisRepo>(),
          globalLocalRepo: context.read<GlobalLocalRepo>()),
      child: _ConnexionPage(),
    );
  }
}

class _ConnexionPage extends StatefulWidget {
  const _ConnexionPage({super.key});

  @override
  State<_ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<_ConnexionPage> {
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  AppButton appButton=AppButton(title: 'welcomed', textColor: Colors.green, text: 'Login',);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.5, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("welcome to App langue  "),
              SizedBox(
                height: 16,
              ),
              Image.asset(
                "assets/images/hello.jpeg",
                height: 150,
                width: 300,
              ),
          SizedBox(height: 16,),
          Text("welcome to taalimak App"),

              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerLogin,
                decoration: InputDecoration(
                    hintText: 'phone number', icon: Icon(Icons.phone)),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                controller: _controllerPassword,
                decoration: InputDecoration(
                    hintText: "password", icon: Icon(Icons.key)),
              ),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                if (state.status == LoginStatus.loading) {
                  return CircularProgressIndicator();
                } else if (state.status == LoginStatus.fail) {
                  return Text(
                    state.message ?? 'érreur',
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container(
                    height: 30,
                  );
                }
              }),
              SizedBox(
                height: 10,
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.status == LoginStatus.done ||
                      state.hasCompteSaved) {
                    Navigator.pushReplacementNamed(
                        context, LanguesPage.routeName);
                  }
                },
                child: ElevatedButton(
                  onPressed: () {

                  },
                 // child: Text('Connexion'),
                  child: AppButton(onPressed: () {
                    String phoneNumber = _controllerLogin.text;
                    String password = _controllerPassword.text;
                    context.read<LoginBloc>().connexion(phoneNumber, password);
                  }, text: "sign-in", title: 'Login', textColor: Colors.white,

                  ),


                  style: ButtonStyle(
                    // Customize various properties like
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(onPressed: (){

              }, child: Text('FORGOT PASSWORD',),
              ),

              SizedBox(
                height: 10,
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("vous avez pas de compte !"),
                    TextButton(
                        onPressed: (){Navigator.pushNamed(context, UserCreatePage.routeName);} ,
                        child: Text(
                          "sign-up",
                        //  style: const TextStyle(),
                        ))
                  ],
                ),


              ),

              SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
