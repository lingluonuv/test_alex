
import 'package:flutter/material.dart';

import 'app_config.dart';

///App entery in development environment
void main () {
  AppConfig.obj.start(env: AppEnvEnum.dev).setupHTTPClient().run();
}