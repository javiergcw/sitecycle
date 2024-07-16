import 'package:flutter/foundation.dart' show kReleaseMode;

class DBTables {
  static const users = kReleaseMode ? "Users" : "UsersTest";
  static const companies = kReleaseMode ? "Companies" : "CompaniesTest";
  static const consecutive = kReleaseMode ? "Consecutive" : "ConsecutiveTest";
}
