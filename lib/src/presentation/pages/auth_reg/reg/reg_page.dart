import 'package:animania/src/configs/app_colors.dart';
import 'package:animania/src/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/buttons/wt_button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: const NetworkImage(
                      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FW5zk_5Q5iAc%2Fmaxres2.jpg%3Fsqp%3D-oaymwEoCIAKENAF8quKqQMcGADwAQH4Ab4EgAKACIoCDAgAEAEYciBJKC4wDw%3D%3D%26rs%3DAOn4CLCiZ53jvHWRnC7Ia3HojqG8UO90bA&f=1&nofb=1&ipt=4561854c83cd6ee0cdc9fbfb2b051ec6e1d9e8a8d0ff92a4b2c8a73377bc5cde'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'Deliver almost everything',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: theme.colorScheme.surface,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 32),
                    WtButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      titleColor: theme.colorScheme.primary,
                      title: 'Continue with Google',
                      leading: Icon(
                        FontAwesomeIcons.google,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 12),
                    WtButton(
                      onPressed: () {},
                      backgroundColor: const Color.fromARGB(255, 66, 136, 242),
                      title: 'Continue with Facebook',
                      leading: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 12),
                    WtButton(
                      onPressed: () {
                        context.pushNamed(
                          'registration_with_email',
                        );
                      },
                      backgroundColor: AppColors.orangePale,
                      title: 'Continue with email',
                      leading: Icon(
                        Icons.email,
                        color: AppColors.purplePale,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            'Ознакомиться',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Please, visit our ',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.surface,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service and Privacy Policy',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' to learn more about how we use your data.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
