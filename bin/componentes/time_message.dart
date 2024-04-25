class TimeMessages {
  String question;
  String messageContext = '';
  bool continueBot = true;

  TimeMessages(this.question);

  bool isAction() {
    List<String> palavras = ['horas', 'dia', 'ano'];

    for (String palavra in palavras) {
      if (question.contains(palavra)) {
        messageContext = palavra;
        return true;
      }
    }
    return false;
  }

  run() {
    DateTime date = DateTime.now();
    Map<String, String> respostas = {
      "horas": 'Olá! são : ${date.hour} horas e ${date.minute} minutos!',
      "dia": ' Olá! hoje é dia: ${date.day}',
      "ano": 'Olá! estamos em : ${date.year}',
    };

    if (respostas.containsKey(messageContext)) {
      return respostas[messageContext];
    }
  }
}
