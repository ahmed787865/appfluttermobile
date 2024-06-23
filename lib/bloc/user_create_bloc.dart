

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapplangue/models/user.dart';
import 'package:flutterapplangue/repo/global_dis_repo.dart';

class UserCreateBloc extends Cubit<UserCreateState>{
  GlobalDisRepo _globalDisRepo;


  UserCreateBloc({
    required GlobalDisRepo globalDisRepo
  }):
  _globalDisRepo = globalDisRepo,
  super(UserCreateState());

  save(User user){
    _globalDisRepo.createUser(user).then((value) {
      emit(state.copyWith(status: true,user: user));
    }).catchError((error){
      emit(state.copyWith(status: false,message:"blbalablalbal"));
    });
  }


}

class UserCreateState extends Equatable{
  final bool  status;
  final String ? message;
  final User ? user;

  UserCreateState({
    this.status = false,
    this.message,
    this.user,
  });

  UserCreateState copyWith({
    bool ? status,
    String ? message,
    User ? user,
  })=> UserCreateState(
    status: status ?? this.status,
    message:  message ?? this.message,
    user: user ?? this.user,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
    user,
  ];

}