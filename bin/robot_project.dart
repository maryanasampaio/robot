import 'dart:io';

import 'componentes/goodbye_massage.dart';
import 'componentes/regard_massage.dart';
import 'componentes/time_message.dart';
import 'utils/stream_robot.dart';

void main() async {
  String robot = 'robot:\n';
  var rodando = true;
  String inputDoUsuario = '';

  var myStream = BotClock().robotStream(1, 15);
  var subscriber = myStream.listen((event) {
    print('                      robot está ativo a: $event segundos');
  }, onDone: () {
    print('robot está sendo finalizado! Faça a ultima pergunta.');
    rodando = false;
  });

  print('-- Iniciando o robot, aguarde..--');
  await BotClock().clock(3);
  print('robot:\n Oi :) \n Como posso ajudar?');
  do {
    inputDoUsuario = stdin.readLineSync().toString().toLowerCase();
    print('-- Processando pergunta, aguarde...--');
    await BotClock().clock(2);

    List<dynamic> acoes = [
      TimeMessages(inputDoUsuario),
      GoodbyeMessage(inputDoUsuario),
      RegardMessage(inputDoUsuario),
    ];

    bool teveResposta = false;

    for (dynamic acao in acoes) {
      if (acao.isAction()) {
        print('$robot ${acao.run()}');
        rodando = acao.continueBot;
        teveResposta = true;
      }
    }

    if (!teveResposta) {
      await BotClock().clock(2);

      print(
          '$robot Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print('$robot Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (rodando);

  await BotClock().clock(3);

  print('--Encerrando robot--');
}
