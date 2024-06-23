

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapplangue/global_var.dart';
import 'package:flutterapplangue/repo/global_dis_repo.dart';
import 'package:flutterapplangue/repo/global_local_repo.dart';
import 'package:flutterapplangue/repo/npl_dis_repo.dart';

class LoginBloc extends Cubit<LoginState>{
  GlobalDisRepo _globalDisRepo;
  GlobalLocalRepo _globalLocalRepo;


  LoginBloc({
    required GlobalDisRepo globalDisRepo,
    required GlobalLocalRepo globalLocalRepo,
  }):
  _globalDisRepo = globalDisRepo,
  _globalLocalRepo = globalLocalRepo,
  super(LoginState());

  load()async{
    _globalLocalRepo.getToken().then((value) {
      NplDisRepo.setGlobalToken(value);
      emit(state.copyWith(
          hasCompteSaved:true,
      ));
    });
  }

  connexion(String phoneNumber,String password){

    _globalDisRepo.connexion(phoneNumber, password).then((value) {
      NplDisRepo.setGlobalToken(value.accessToken);
      _globalLocalRepo.saveToken(value.accessToken!,value.refreshToken!);
      emit(state.copyWith(
        status: LoginStatus.done,
      ));
    }).catchError((error){
        emit(state.copyWith(
            status: LoginStatus.fail,
            message: 'conexion error'
        ));
        throw error;

    });
  }

}

enum LoginStatus {init,loading,done,fail}

class LoginState extends Equatable{
  final LoginStatus status;
  final String ? message;
  final bool  hasCompteSaved;

  LoginState({
    this.status=LoginStatus.init,
    this.message,
    this.hasCompteSaved = false,
  });

  LoginState copyWith({
    LoginStatus ? status,
    String ? message,
    bool ? hasCompteSaved,
  })=>LoginState(
    status:status ?? this.status,
    message:message ?? this.message,
    hasCompteSaved: hasCompteSaved ?? this.hasCompteSaved
  );

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,hasCompteSaved];



}