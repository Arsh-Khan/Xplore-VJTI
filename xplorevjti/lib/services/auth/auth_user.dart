import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;

  const AuthUser(this.isEmailVerified);
}

class MyAuthUser extends AuthUser {
  const MyAuthUser(bool isEmailVerified) : super(isEmailVerified);
}
