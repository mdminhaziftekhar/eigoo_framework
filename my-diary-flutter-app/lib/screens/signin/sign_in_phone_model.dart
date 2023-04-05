import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/auth_service.dart';
import '../../state/sign_in_state.dart';

class SignInPhoneModel extends StateNotifier<SignInState> {
  SignInPhoneModel({
    required this.authService,
  }) : super(const SignInState.notValid());

  AuthService authService;

  LibPhonenumberTextFormatter get phoneNumberFormatter {
    return LibPhonenumberTextFormatter(
      phoneNumberType: PhoneNumberType.mobile,
      phoneNumberFormat: PhoneNumberFormat.international,
      country: authService.selectedCountry,
      onFormatFinished: (inputText) async => parsePhoneNumber(inputText),
    );
  }

  Future<void> parsePhoneNumber(String inputText) async {
    try {
      await authService.parsePhoneNumber(inputText);
      state = SignInState.canSubmit();
    } catch (e) {
      print(e.toString());
      if (!e.toString().contains('parse')) {
        state = SignInState.error(e.toString());
      } else {
        state = SignInState.notValid();
      }
    }
  }

  Future<void> verifyPhone() async {
    state = SignInState.loading();
    try {
      authService.verifyPhone(() {
        state = SignInState.success();
      });
    } catch (e) {
      state = SignInState.error(e.toString());
    }
  }
}