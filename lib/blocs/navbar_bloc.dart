import 'dart:async';

enum NavBarItem { HOME, PROFILE, ABOUT }

class NavBarBloc {
  final StreamController<NavBarItem> _streamController = StreamController<NavBarItem>.broadcast();
  final NavBarItem defaultItem = NavBarItem.HOME;
  Stream<NavBarItem> get navbarData => _streamController.stream;
  void pickItem(int i) {
    switch(i) {
      case 0:
        _streamController.sink.add(NavBarItem.HOME);
        break;
      case 1:
        _streamController.sink.add(NavBarItem.PROFILE);
        break;
      case 2:
        _streamController.sink.add(NavBarItem.ABOUT);
        break;
    }
  }

  close() {
    _streamController.close();
  }

}