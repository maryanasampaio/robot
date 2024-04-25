class GoodbyeMessage {
  String question;
  String messageContext = '';
  bool continueBot = false;

  GoodbyeMessage(this.question);

  isAction() {
    List<String> palavras = ['xau', 'tchau', 'adeus', 'até mais', 'pare'];

    for (String palavra in palavras) {
      if (question.contains(palavra)) {
        return true;
      }
    }
    return false;
  }

  run() {
    return 'Até a proxima!!';
  }
}
