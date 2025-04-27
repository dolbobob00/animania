import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../widgets/buttons/wt_button.dart';
import '../../../../widgets/pin_code_input/pin_code_input.dart';
import '../../../../cubits/user_info_cubit/cubit/user_info.dart';

class SendMsgChoose extends StatelessWidget {
  const SendMsgChoose({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                      child: Text(
                        'Verification Code',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Please enter the verification code sent to your phone number',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.primary.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  PinCodeInput(
                    onCompleted: (code) {
                    //!OnCompleted code
                      print('Completed: $code');
                    },
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      //! Handle resend code
                    },
                    child: Text(
                      'Resend Code',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  height: 90,
                  child: WtButton(
                    onPressed: () {
                      //! Verify code and navigate to next screen
                      context.goNamed('home');
                    },
                    title: 'Verify',
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
