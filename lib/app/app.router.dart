// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/login/login_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/signup/signup_view.dart';

class Routes {
  static const String loginView = '/';
  static const String mainView = '/main-view';
  static const String signUpView = '/sign-up-view';
  static const all = <String>{
    loginView,
    mainView,
    signUpView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.signUpView, page: SignUpView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
        settings: data,
      );
    },
  };
}
