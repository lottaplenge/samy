import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/logout/logout_update.dart';

abstract class LogoutMessage extends UpdateMessage {
  LogoutMessage() : super(routeTo: LogoutUpdate);
}

class LogoutUser extends LogoutMessage {}