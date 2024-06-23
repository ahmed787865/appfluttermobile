

import 'dart:convert';

import 'package:flutterapplangue/global_var.dart';
import 'package:flutterapplangue/models/langue.dart';
import 'package:flutterapplangue/models/teacher.dart';
import 'package:flutterapplangue/models/token.dart';
import 'package:flutterapplangue/models/user.dart';
import 'package:flutterapplangue/repo/npl_dis_repo.dart';

class GlobalDisRepo extends NplDisRepo{

  GlobalDisRepo(){}

  
  
  Future<Token> connexion(String phoneNumber,String password) async {
    if(my__test){
      return Token(
        accessToken: "fdfdsfdsf",
        refreshToken: 'dsfsdfsdfsdf'
      );
    }
    return postRequest(
        'api/token/',
        {
          'phone_number' : phoneNumber,
          'password' : password
        },
        (p0) {
          Map<String,dynamic> data= jsonDecode(p0);
          Token token = Token(
              accessToken: data['access'],
              refreshToken: data['refresh']
          );;
          print(token);
          return token;
        },
        needToken: false,
    );
  }



  Future<User> createUser(User user) async{
    if(my__test){
      return User(id: 1,name: "ahmed",password: 'test',phone: "778678765");
    }
    return postRequest(
        'api/token/',
        user.toJson(),
        (p0) {
          Map<String,dynamic> data= jsonDecode(p0);
          return User.fromJson(data);
        },
        needToken: true,
    );
  }
  

  Future<List<Langue>> allLangues() async{
    if(my__test){
      return [
        Langue(id: "1",name: "Arabe"),
        Langue(id: "2",name: "Francais"),
        Langue(id: "3",name: "Anglais"),
      ];
    }
    return getRequest(
        'languages/',
        (p0) {
          List data= jsonDecode(p0);
          return data.map((e) => Langue.fromJson(e)).toList();
        }
    );
  }
  Future<List<Teacher>> teachersByLangue(String langueId) async{
    if(my__test){
      return [
        Teacher(id: "ee",phone: '776544454',name: 'ahmed bile',joined: DateTime.now()),
        Teacher(id: "ee",phone: '779876545',name: 'Mouhamaden babou',joined: DateTime.now()),
        Teacher(id: "r",phone: '772768798',name: 'Aboubacar ',joined: DateTime.now()),
        Teacher(id: "ee",phone: '771544454',name: 'Omar',joined: DateTime.now()),
      ];
    }
    return getRequest(
        'teachers/language/$langueId/',
            (p0) {
          List data= jsonDecode(p0);
          return data.map((e) => Teacher.fromJson(e)).toList();
        }
    );
  }


}