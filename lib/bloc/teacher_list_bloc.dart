


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapplangue/models/teacher.dart';
import 'package:flutterapplangue/repo/global_dis_repo.dart';

class TeacherListBloc extends Cubit<TeacherListState>{
  final GlobalDisRepo _globalDisRepo;

  TeacherListBloc({
    required GlobalDisRepo globalDisRepo,
      required String langueId,
  }):
  _globalDisRepo = globalDisRepo,
  super(
    TeacherListState(
      langueId: langueId
    )
  );

  load()async{
    emit(state.copyWith(status: TeacherListStatus.loading));
    await _globalDisRepo.teachersByLangue(state.langueId).then((value){
      emit(state.copyWith(
        data: value,
        status: TeacherListStatus.done,
      ));
    }).catchError((error){
      emit(state.copyWith(
        message: 'erreur',
        status: TeacherListStatus.fail,
      ));
      throw error;
    });
  }
  }



enum TeacherListStatus {init,loading,done,fail}

class TeacherListState extends Equatable{
  final TeacherListStatus status;
  final List<Teacher> ? data;
  final String ? message;
  final String langueId;

  TeacherListState({
      required this.langueId,
    this.status = TeacherListStatus.init,
    this.data,
    this.message,
  });

  TeacherListState copyWith({
      String ? langueId,
      TeacherListStatus ? status,
      List<Teacher> ? data,
      String ? message
  })=>TeacherListState(
    langueId: langueId ?? this.langueId,
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );


  @override
  // TODO: implement props
  List<Object?> get props => [
    langueId,
    status,
    message,
    data,
  ];

}