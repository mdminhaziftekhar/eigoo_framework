import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/api/api.dart';
import 'package:my_diary/services/api_services.dart';
import 'package:my_diary/services/auth_service.dart';
import 'package:my_diary/state/auth_state.dart';


final apiProvider = Provider<Api>((ref) => Api.instance);
final apiServiceProvider =
    Provider<ApiService>((ref) => ApiService(ref.read(apiProvider)));

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authStateProvider = StateNotifierProvider<AuthService, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService;
});

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChanges());
