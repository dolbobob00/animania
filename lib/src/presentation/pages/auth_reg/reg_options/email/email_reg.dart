import 'package:animania/src/presentation/widgets/confidentiality_info/conf_rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../configs/app_colors.dart';
import '../../../../cubits/user_info_cubit/cubit/user_info.dart';
import '../../../../widgets/buttons/wt_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/country_selector/country_selector.dart';
import '../../../../../data/models/country_model.dart';

class EmailReg extends StatelessWidget {
  const EmailReg({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final regBloc = context.read<UserInfoCubit>();
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
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Profile details',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                  BlocSelector<UserInfoCubit, UserInfoState, CountryModel?>(
                    selector: (state) => state.selectedCountry,
                    builder: (context, selectedCountry) {
                      return CountrySelector(
                        selectedCountry: selectedCountry,
                        onCountrySelected: (country) {
                          context.read<UserInfoCubit>().setCountry(country);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const CustomTextfield(
                    label: 'Email',
                    isPassword: false,
                  ),
                  const SizedBox(height: 16),
                  const CustomTextfield(
                    label: 'Name',
                    maxLength: 100,
                  ),
                  const SizedBox(height: 18),
                  const CustomTextfield(
                    label: 'Surname',
                    maxLength: 100,
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConfRules(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Stack(

                  children: [
                    Container(
                      height: 110,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: AppColors.orangePale.withOpacity(0.7),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.stream_rounded, color: theme.colorScheme.primary),
                            const SizedBox(width: 8),
                            Text(
                              'Get 10% off your first order',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14.0, left: 12, right: 12),
                          child: BlocSelector<UserInfoCubit, UserInfoState, bool?>(
                            selector: (state) {
                              return state.confRules;
                            },
                            builder: (context, state) {
                              return WtButton(
                                onPressed: () {
                                  if (state == true) {
                                    context.pushNamed('phone_initialize');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please accept the rules'),
                                      ),
                                    );
                                  }
                                },
                                title: 'Continue',
                                mainAxisAlignment: MainAxisAlignment.center,
                                backgroundColor: state == true
                                    ? theme.colorScheme.primary
                                    : Colors.grey,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
