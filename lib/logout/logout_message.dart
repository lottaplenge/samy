import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/logout/logout_update.dart';

abstract class LogoutMessage extends UpdateMessage {
  LogoutMessage() : super(routeTo: LogoutUpdate);
}

class LogoutUser extends LogoutMessage {}