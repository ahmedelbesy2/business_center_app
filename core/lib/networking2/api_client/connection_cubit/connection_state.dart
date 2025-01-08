part of 'connection_cubit.dart';

@immutable
abstract class InternetConnectionState {}

class ConnectionInitial extends InternetConnectionState {}

class ConnectionSuccess extends InternetConnectionState {}

class ConnectionFail extends InternetConnectionState {}
