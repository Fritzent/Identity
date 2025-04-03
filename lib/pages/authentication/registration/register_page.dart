import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/bloc/register_auth_bloc.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/repository/auth_repository.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';
import 'package:identity/routes/app_route_constants.dart';
import 'package:identity/services/auth_service.dart';
import 'package:identity/widgets/custom_border_button.dart';
import 'package:identity/widgets/custom_button.dart';
import 'package:identity/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final authService = AuthService();
        final authRepository = AuthRepository(authService);
        return RegisterAuthBloc(authRepository: authRepository);
      },
      child: BlocBuilder<RegisterAuthBloc, RegisterAuthState>(
        builder: (context, state) {
          var bloc = context.read<RegisterAuthBloc>();
          return BlocListener<RegisterAuthBloc, RegisterAuthState>(
            listener: (context, state) {
              if (state.isRegistrationDone) {
                if (mounted) {
                  GoRouter.of(context).pushReplacementNamed(
                      IdentityRouteConstant.registerDataChoose);
                }
              }
            },
            child: Scaffold(
              body: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: kIsWeb
                        ? (MediaQuery.of(context).size.width / 2 >= 800
                            ? MediaQuery.of(context).size.width * 0.4
                            : MediaQuery.of(context).size.width)
                        : MediaQuery.of(context).size.width,
                  ),
                  child: LayoutBuilder(builder: (context, constraints) {
                    Widget content = Stack(children: [
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: FontList.font24,
                            vertical: FontList.font64,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.signUp,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                fontSize: FontList.font32,
                                              ),
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .signUpSubTitle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontSize: FontList.font20,
                                              ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Column(
                                      children: [
                                        Gap(FontList.font8),
                                        Column(
                                          spacing: FontList.font16,
                                          children: [
                                            CustomTextField(
                                              textFieldLabel:
                                                  AppLocalizations.of(context)!
                                                      .fullNameText,
                                              textFieldHint:
                                                  AppLocalizations.of(context)!
                                                      .inputFullNameHintText,
                                              keypadType: TextInputType.text,
                                              formSection:
                                                  AppLocalizations.of(context)!
                                                      .fullNameText,
                                              onChanged: (value) {
                                                bloc.add(OnFieldTextChanges(
                                                    value,
                                                    AppLocalizations.of(
                                                            context)!
                                                        .fullNameText,
                                                    context));
                                              },
                                              externalErrorText: state
                                                      .fieldErrorComponent
                                                      .any((error) =>
                                                          error.containsKey(
                                                              AppLocalizations.of(context)!
                                                                  .fullNameText))
                                                  ? state.fieldErrorComponent
                                                          .firstWhere((error) =>
                                                              error.containsKey(AppLocalizations.of(context)!.fullNameText))[
                                                      AppLocalizations.of(context)!
                                                          .fullNameText]!
                                                  : '',
                                            ),
                                            CustomTextField(
                                              textFieldLabel:
                                                  AppLocalizations.of(context)!
                                                      .emailText,
                                              textFieldHint:
                                                  AppLocalizations.of(context)!
                                                      .inputEmailHintText,
                                              keypadType:
                                                  TextInputType.emailAddress,
                                              formSection:
                                                  AppLocalizations.of(context)!
                                                      .emailText,
                                              onChanged: (value) {
                                                bloc.add(OnFieldTextChanges(
                                                    value,
                                                    AppLocalizations.of(
                                                            context)!
                                                        .emailText,
                                                    context));
                                              },
                                              externalErrorText: state
                                                      .fieldErrorComponent
                                                      .any((error) =>
                                                          error.containsKey(
                                                              AppLocalizations.of(context)!
                                                                  .emailText))
                                                  ? state.fieldErrorComponent
                                                          .firstWhere((error) =>
                                                              error.containsKey(AppLocalizations.of(context)!.emailText))[
                                                      AppLocalizations.of(context)!
                                                          .emailText]!
                                                  : '',
                                            ),
                                            CustomTextField(
                                              textFieldLabel:
                                                  AppLocalizations.of(context)!
                                                      .createPasswordText,
                                              textFieldHint:
                                                  AppLocalizations.of(context)!
                                                      .createPasswordHintText,
                                              keypadType: TextInputType.text,
                                              formSection:
                                                  AppLocalizations.of(context)!
                                                      .createPasswordText,
                                              hasRightIcon: true,
                                              rightIconPath:
                                                  'assets/image/ic_hide_password.svg',
                                              obscureText: true,
                                              onChanged: (value) {
                                                bloc.add(OnFieldTextChanges(
                                                    value,
                                                    AppLocalizations.of(
                                                            context)!
                                                        .createPasswordText,
                                                    context));
                                              },
                                              externalErrorText: state
                                                      .fieldErrorComponent
                                                      .any((error) => error.containsKey(
                                                          AppLocalizations.of(context)!
                                                              .createPasswordText))
                                                  ? state.fieldErrorComponent
                                                          .firstWhere((error) =>
                                                              error.containsKey(AppLocalizations.of(context)!.createPasswordText))[
                                                      AppLocalizations.of(context)!
                                                          .createPasswordText]!
                                                  : '',
                                            ),
                                            CustomTextField(
                                              textFieldLabel:
                                                  AppLocalizations.of(context)!
                                                      .confirmPasswordText,
                                              textFieldHint:
                                                  AppLocalizations.of(context)!
                                                      .confirmPasswordHintText,
                                              keypadType: TextInputType.text,
                                              formSection:
                                                  AppLocalizations.of(context)!
                                                      .confirmPasswordText,
                                              hasRightIcon: true,
                                              rightIconPath:
                                                  'assets/image/ic_hide_password.svg',
                                              obscureText: true,
                                              onChanged: (value) {
                                                bloc.add(OnFieldTextChanges(
                                                    value,
                                                    AppLocalizations.of(
                                                            context)!
                                                        .confirmPasswordText,
                                                    context));
                                              },
                                              externalErrorText: state
                                                      .fieldErrorComponent
                                                      .any((error) => error.containsKey(
                                                          AppLocalizations.of(context)!
                                                              .confirmPasswordText))
                                                  ? state.fieldErrorComponent
                                                          .firstWhere((error) =>
                                                              error.containsKey(AppLocalizations.of(context)!.confirmPasswordText))[
                                                      AppLocalizations.of(context)!
                                                          .confirmPasswordText]!
                                                  : '',
                                            ),
                                            Gap(FontList.font16),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          FontList.font24),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    bloc.add(OnRegisterAuth(
                                                        context));
                                                  },
                                                  child: CustomButton(
                                                      textButton:
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .signUp)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          FontList.font24),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: kIsWeb
                                                        ? (MediaQuery.of(context)
                                                                        .size
                                                                        .width /
                                                                    2 >=
                                                                1000
                                                            ? 2
                                                            : 3)
                                                        : 1,
                                                    child: Container(
                                                      height: 1,
                                                      decoration: BoxDecoration(
                                                          color: ColorList
                                                              .generalWhite100AppFonts),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      AppLocalizations.of(
                                                              context)!
                                                          .continueWithText,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: ColorList
                                                                  .generalWhite100AppFonts),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: kIsWeb
                                                        ? (MediaQuery.of(context)
                                                                        .size
                                                                        .width /
                                                                    2 >=
                                                                1000
                                                            ? 2
                                                            : 3)
                                                        : 1,
                                                    child: Container(
                                                      height: 1,
                                                      decoration: BoxDecoration(
                                                          color: ColorList
                                                              .generalWhite100AppFonts),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          FontList.font24),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    print(
                                                        'Hello Button SignUp');
                                                  },
                                                  child: CustomBorderButton(
                                                    textButton:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .google,
                                                    hasLogo: true,
                                                    logoPath:
                                                        'assets/image/ic_google_logo.svg',
                                                  )),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                children: [
                                                  TextSpan(
                                                    text: AppLocalizations.of(
                                                            context)!
                                                        .alreadyHaveAccount,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: ColorList
                                                              .generalWhite100AppFonts,
                                                        ),
                                                  ),
                                                  WidgetSpan(
                                                    child: ShaderMask(
                                                      shaderCallback:
                                                          (bounds) =>
                                                              LinearGradient(
                                                        colors: [
                                                          ColorList
                                                              .generalBlueAppFonts,
                                                          ColorList
                                                              .generalBlue100AppFonts,
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ).createShader(bounds),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          if (mounted) {
                                                            GoRouter.of(context)
                                                                .pushReplacementNamed(
                                                                    IdentityRouteConstant
                                                                        .loginRouteName);
                                                          }
                                                        },
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .signIn,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium
                                                                  ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      if (state.isLoading)
                        Positioned(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              color: Colors.black.withValues(alpha: 0.5),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ]);

                    return LayoutBuilder(builder: (context, constraints) {
                      return SingleChildScrollView(
                          child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constraints.maxHeight,
                              ),
                              child: IntrinsicHeight(child: content)));
                    });
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
