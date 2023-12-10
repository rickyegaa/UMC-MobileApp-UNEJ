part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class OnSendChat extends ChatEvent {
  final String dokter;

  OnSendChat({required this.dokter});
}
