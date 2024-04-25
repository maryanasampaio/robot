class RegardMessage {
  String question;
  String messageContext = '';
  bool continueBot = true;

  RegardMessage(this.question);

  bool isAction() {
    List<String> palavras = [
      'oi',
      'ola',
      'obrigado',
      'obrigada',
      'bom dia',
      'boa tarde',
      'boa noite',
    ];

    for (String palavra in palavras) {
      if (question.contains(palavra)) {
        messageContext = palavra;
        return true;
      }
    }

    return false;
  }

  run() {
    Map<String, String> respostas = {
      'oi': 'Muito prazer!',
      'ola': 'Muito prazer!',
      'obrigado': 'por nada, fique a vontade.',
      'obrigada': 'por nada, fique a vontade.',
      'bom dia': 'bom dia, espero que tenha dormido bem!',
      'boa tarde': 'Opa, boa tarde! espero que seu dia esteja sendo muito bom!',
      'boa noite': 'Uma bela noita para você!!!',
    };

    if (respostas.containsKey(messageContext)) {
      return respostas[messageContext];
    }
  }
}
