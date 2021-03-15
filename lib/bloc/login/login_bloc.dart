import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:kuma_flutter_app/enums/login_status.dart';
import 'package:kuma_flutter_app/model/api/social_user.dart';
import 'package:kuma_flutter_app/repository/api_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository repository;

  LoginBloc({this.repository}) : super(LoginState._());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      yield* _mapToLogin(event);
    }
  }

  Stream<LoginState> _mapToLogin(Login event) async* {

    try {
      yield LoginState.loading();

      Map<LoginStatus, SocialUserData> loginData = await repository.login(
          context: event.context, type: event.type);

      LoginStatus status = loginData.keys.first;
      SocialUserData data = loginData.values.first;

      switch (status) {
        case LoginStatus.NeedRegister:
          yield LoginState.needRegister(userData: data);
          break;
        case LoginStatus.LoginSuccess:
          yield LoginState.success();
          break;
        case LoginStatus.WrongPassword:
          yield LoginState.wrongPassword();
          break;
        case LoginStatus.Failure:
          yield LoginState.failure();
          break;
        default:
          yield LoginState._();
          break;
      }
    }on Exception catch(e){
      print('_mapToLogin Error:$e}');
      yield LoginState.failure();
    }
  }
}
