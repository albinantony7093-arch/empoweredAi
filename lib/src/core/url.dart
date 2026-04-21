import 'package:flutter_dotenv/flutter_dotenv.dart';

class Url {
  static String baseUrl = dotenv.env['BASE_URL'] ?? '<url not found>';

  static String login = 'auth/login';
  static String register = 'auth/register';

  static String refresh = "user/refresh";

  static String questions = "test/questions";
  static String submit = "test/submit";
}
