import 'package:animania/src/configs/app_colors.dart';
import 'package:animania/src/presentation/cubits/user_info_cubit/cubit/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfRules extends StatelessWidget {
  const ConfRules({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = context.read<UserInfoCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<UserInfoCubit, UserInfoState, bool>(
              bloc: userInfo,
              selector: (state) => state.confRules,
              builder: (context, isChecked) {
                return Checkbox.adaptive(
                  value: isChecked,
                  onChanged: (value) {
                    if (value != null) {
                      userInfo.setIsAgreedWithConfRules(value);
                    }
                  },
                );
              },
            ),
            Expanded(
              child: RichText(
                softWrap: true,
                overflow: TextOverflow.visible,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'I agree to the ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: 'Confidentiality Rules',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: 'User Agreement',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: ' of the application',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: 'I agreed to the analyze my data. ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: '\nI agreed to the analyze my data. ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Please, visit our Paper about confidentiality, to know more about how we use your data.',
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
          ),
        ),
      ],
    );
  }
}
