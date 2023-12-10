import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:umc_mobile/model/chat_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final chatC = TextEditingController();
  List<ChatModel> chatDokter1 = [];
  List<ChatModel> chatDokter2 = [];
  List<ChatModel> chatDokter3 = [];
  ChatBloc() : super(ChatInitial()) {
    on<OnSendChat>(onSendChat);
  }

  void onSendChat(OnSendChat event, Emitter<ChatState> emit) {
    if (chatC.text.isNotEmpty) {
      debugPrint('State 3');
      var chatModel = ChatModel(chat: chatC.text, isUser: true);
      switch (event.dokter) {
        case 'dokter1':
          chatDokter1.add(chatModel);
          break;
        case 'dokter2':
          chatDokter2.add(chatModel);
          break;
        case 'dokter3':
          chatDokter3.add(chatModel);
          break;
        default:
      }
      debugPrint('State 4' + event.dokter);
      emit(ChatInitial());
      chatC.clear();
    }
  }
}
