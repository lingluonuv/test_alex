
import 'app_config.dart';

///App entery in production environment
void main () {
  AppConfig.obj.start(env: AppEnvEnum.prod).setupHTTPClient().run();
}