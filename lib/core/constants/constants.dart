import 'package:flutter/foundation.dart';

class Constants {
  static const String graphqlApiUrl =
  kIsWeb ? 'http://localhost:5001/graphql' : 'http://10.0.2.2:5001/graphql';
}