part of 'regis_bloc.dart';

@immutable
sealed class RegisEvent {}

class OnRegisEvent extends RegisEvent {}

class ClearEvent extends RegisEvent {}
