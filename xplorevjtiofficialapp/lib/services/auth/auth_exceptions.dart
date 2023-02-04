/*
  This file contains the Firebase Auth Excpetions used in our code
*/

// Login Exceptions

class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// Register Exceptions

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

// Generic Exceptions

class GenericAuthExceptions implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
