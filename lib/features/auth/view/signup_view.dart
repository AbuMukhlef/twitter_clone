import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import '../../../common/common.dart';
import '../../../constants/constants.dart';
import '../../../theme/theme.dart';
import '../widgets/auth_field.dart';
import 'login_view.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
// to rebuild the appbar only once
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUP() {
    ref.read(authControllerProvider.notifier).signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isdLoading = ref.watch(authControllerProvider);
    return Scaffold(
      // to rebuild the appbar only once
      appBar: appbar,
      body: isdLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AuthField(controller: emailController, hintText: 'Email'),
                      const SizedBox(height: 25),
                      AuthField(
                          controller: passwordController, hintText: 'Password'),
                      const SizedBox(height: 40),
                      Align(
                          alignment: Alignment.topRight,
                          child: RoundedSmallButton(
                              onTap: onSignUP, label: 'Done')),
                      const SizedBox(height: 40),
                      RichText(
                        text: TextSpan(
                          text: "Do you have an account? ",
                          style: const TextStyle(
                            color: Pallete.greyColor,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: 'login',
                              style: const TextStyle(
                                color: Pallete.blueColor,
                                fontSize: 12,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context, LoginView.route());
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
