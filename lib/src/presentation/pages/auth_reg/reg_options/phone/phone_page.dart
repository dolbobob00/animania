import 'package:animania/src/configs/app_colors.dart';
import 'package:animania/src/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../cubits/user_info_cubit/cubit/user_info.dart';
import '../../../../widgets/buttons/wt_button.dart';
import '../../../../widgets/phone_input/phone_input.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({super.key});

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
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                      child: Text(
                        'Phone Number',
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
                        maxLines: 3,
                        'Your phone will be using only for contact about your order',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.purpleLight,
                        ),
                      ),
                    ),
                  ),
                  PhoneInput(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 95,
                  padding:
                      const EdgeInsets.only(bottom: 14.0, left: 12, right: 12),
                  child: BlocSelector<UserInfoCubit, UserInfoState, String?>(
                    selector: (state) {
                      return state.phoneNumber;
                    },
                    builder: (context, state) {
                      return WtButton(
                        onPressed: () {
                          if (state == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please input number'),
                              ),
                            );
                          } else if (state.length > 6) {
                            context.pushNamed('send_msg');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please input number'),
                              ),
                            );
                          }
                        },
                        title: 'Continue',
                        mainAxisAlignment: MainAxisAlignment.center,
                        backgroundColor: state != null && state.length > 6
                            ? theme.colorScheme.primary
                            : Colors.grey,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
