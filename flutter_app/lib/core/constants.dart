import 'package:flutter_dotenv/flutter_dotenv.dart';

String BASE_URL = DotEnv().env['BASE_URL'];
String OUTLETS_URL = BASE_URL + "interview/outlets";
String CATALOG_URL = BASE_URL + "interview/catalog";
