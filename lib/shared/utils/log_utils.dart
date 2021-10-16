import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';



class LogUtils {
  // ignore: constant_identifier_names
  static const String TAG = "ACT Task:";

  static log([String tag = TAG, dynamic msg]) {
    if (!kReleaseMode) {
      developer.log('$msg', name: tag);
    }
  }

  ///Singleton factory
  static final LogUtils _instance = LogUtils._internal();

  factory LogUtils() {
    return _instance;
  }

  LogUtils._internal();
}
