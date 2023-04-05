import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/auth_service.dart';
import '../../state/sign_in_state.dart';

final delayBeforeUserCanRequestNewCode = 30;

class SignInVerificationModel extends StateNotifier<SignInState> {
  SignInVerificationModel({
    required this.authService,
  }) : super(const SignInState.notValid()) {
    _startTimer();
  }

  AuthService authService;
  String get formattedPhoneNumber => authService.formattedPhoneNumber;

  late Timer _timer;
  late StreamController<int> countdown = StreamController<int>();
  late int _countdown;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _countdown = delayBeforeUserCanRequestNewCode;
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (_countdown == 0) {
          timer.cancel();
        } else {
          _countdown--;
          countdown.add(_countdown);
        }
      },
    );
  }

  void resendCode() {
    state = SignInState.loading();
    try {
      authService.verifyPhone(() {
        state = SignInState.canSubmit();
        _startTimer();
      });
    } catch (e) {
      state = SignInState.error(e.toString());
    }
  }

  Future<void> verifyCode(String smsCode) async {
    state = SignInState.loading();
    try {
      await authService.verifyCode(smsCode, () {
        state = SignInState.success();
        
      });
    } catch (e) {
      if (e.toString() == "invalid-verification-code") {
        state = SignInState.error("Invalid verification code!");
      } else {
        state = SignInState.error(e.toString());
      }
    }
  }
}
