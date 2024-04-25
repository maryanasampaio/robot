class BotClock {
  Future clock(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  Stream robotStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
    print('Astream terminou!');
  }
}
