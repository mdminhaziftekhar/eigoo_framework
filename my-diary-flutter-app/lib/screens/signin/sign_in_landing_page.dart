import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/services/auth_service.dart';

import '../../provider.dart';
import '../../routing/app_router.dart';
import '../../state/sign_in_state.dart';
import '../../widgets/buttons.dart';

class SignInLandingPage extends ConsumerWidget {
  Future<void> _openSignup(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      AppRoutes.signInPhonePage,
      arguments: () => navigator.pop(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Firebase Phone Auth with Riverpod",
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Center(child: FlutterLogo(size: 120)),
            SizedBox(height: 30),
            Text(
              "Welcome to this demo app using Firebase Phone Authentication and Riverpod for its State Management",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.asset(
            //       "assets/images/happy.png",
            //       width: 150,
            //     ),
            //     Image.asset(
            //       "assets/images/happy.png",
            //       width: 150,
            //     ),
            //   ],
            // ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: "Sign in with phone number",
                onPressed: () => _openSignup(context),
              ),
            ),

            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: "Sign in with Google",
                onPressed: () {
                  AuthService().signInWithGoogle();
                },
              ),
            ),

            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
