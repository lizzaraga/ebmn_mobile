import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class Credentials extends Equatable{
  final String email;
  final String password;

  Credentials({@required this.email, @required this.password});
  @override
  // TODO: implement props
  List<Object> get props => [email, password];

  @override
  bool get stringify => true;

}