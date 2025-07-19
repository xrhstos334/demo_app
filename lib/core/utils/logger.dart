


import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';

class Log{
  static final talker = Talker();

  static e(String msg){
    if(kDebugMode){
      talker.error(msg.toString());
    }

  }

  static i(String msg){
    if(kDebugMode){
      talker.info(msg.toString());
    }
  }

  static w(String msg){
    if(kDebugMode){
      talker.warning(msg);
    }
  }
}
