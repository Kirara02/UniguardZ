abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const MAIN = _Paths.MAIN;
  static const FORM = _Paths.FORM;
  static const TASK = _Paths.TASK;
  static const ACTIVITY = _Paths.ACTIVITY;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/';
  static const MAIN = '/main';
  static const LOGIN = '/login';
  static const FORM = '/form';
  static const TASK = '/task';
  static const ACTIVITY = '/activity';
}
