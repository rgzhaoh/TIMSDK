import 'dart:async';

class OptimizeUtils {
  static throttle(Function func, int milliseconds) {
    bool enable = true;
    return (val) {
      if (enable == true) {
        enable = false;
        Future.delayed(Duration(milliseconds: milliseconds), () {
          enable = true;
          func(val);
        });
      }
    };
  }

  static debounce(
    Function(String text) fun, [
    Duration delay = const Duration(milliseconds: 100),
  ]) {
    Timer? timer;
    return (String text) {
      if (timer != null) {
        timer?.cancel();
      }

      timer = Timer(delay, () {
        fun(text);
      });
    };
  }
}