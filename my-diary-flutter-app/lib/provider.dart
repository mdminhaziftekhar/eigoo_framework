import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/api/api.dart';
import 'package:my_diary/services/api_services.dart';

final apiProvider= Provider<Api>((ref) => Api.instance);
final apiServiceProvider =
    Provider<ApiService>((ref) => ApiService(ref.read(apiProvider)));