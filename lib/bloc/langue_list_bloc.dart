


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapplangue/models/langue.dart';
import 'package:flutterapplangue/repo/global_dis_repo.dart';
import 'package:flutterapplangue/repo/global_local_repo.dart';

class LangueListBloc extends Cubit<LangueListState>{
  final GlobalDisRepo _globalDisRepo;
  final GlobalLocalRepo _globalocalRepo;

  LangueListBloc({
    required GlobalDisRepo globalDisRepo,
    required GlobalLocalRepo globalLocalRepo,
  }):
        _globalDisRepo = globalDisRepo,
        _globalocalRepo = globalLocalRepo,
        super(
          LangueListState()
      );

  load()async{
    emit(state.copyWith(status: LangueListStatus.loading));
    await _globalDisRepo.allLangues().then((value){
      emit(state.copyWith(
        data: value,
        status: LangueListStatus.done,
      ));
    }).catchError((error){
      emit(state.copyWith(
        message: 'la requete à echoué, veuillez téessayer',
        status: LangueListStatus.fail,
      ));
      throw error;
    });
  }

  deconnexion(){
    _globalocalRepo.deleteAllSaved();
  }

}

enum LangueListStatus {init,loading,done,fail}

class LangueListState extends Equatable{
  final LangueListStatus status;
  final List<Langue> ? data;
  final String ? message;

  LangueListState({
    this.status = LangueListStatus.init,
    this.data,
    this.message,
  });

  LangueListState copyWith({
    LangueListStatus ? status,
    List<Langue> ? data,
    String ? message
  })=>LangueListState(
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );


  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
    data,
  ];

}