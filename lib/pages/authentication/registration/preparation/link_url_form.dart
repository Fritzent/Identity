import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:identity/bloc/personal_url_bloc.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/repository/selected_data_repository.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';
import 'package:identity/services/selected_page_service.dart';
import 'package:identity/widgets/custom_button.dart';
import 'package:identity/widgets/custom_text_field.dart';

class LinkUrlForm extends StatefulWidget {
  const LinkUrlForm({super.key});

  @override
  State<LinkUrlForm> createState() => _LinkUrlFormState();
}

class _LinkUrlFormState extends State<LinkUrlForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalUrlBloc()..add(OnValidateFormVisible()),
      child: BlocBuilder<PersonalUrlBloc, PersonalUrlState>(
        builder: (context, state) {
          var bloc = context.read<PersonalUrlBloc>();
          return BlocListener<PersonalUrlBloc, PersonalUrlState>(
            listener: (context, state) {
              if (!state.isLoading && state.isRegisterLinkDone) {
                final selectedPageService = SelectedPageService();
                final dataRepository =
                    SelectedDataRepository(selectedPageService);

                if (mounted) {
                  dataRepository.selectedPageService
                      .checkNextPage(context, 'LinkUrlFormPage');
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
                              Widget content = Stack(
                                children: [
                                  Positioned(
                                      child: Padding(
                                    padding: EdgeInsets.only(
                                      top: kIsWeb ? FontList.font16 : FontList.font32,
                                      left: FontList.font24,
                                      right: FontList.font24,
                                    ),
                                    child: Column(
                                      spacing: FontList.font29,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.start,
                                                  AppLocalizations.of(context)!
                                                      .personalLinkTitle,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                        fontSize: FontList.font24,
                                                      ),
                                                ),
                                                Gap(FontList.font16),
                                                Text(
                                                  textAlign: TextAlign.start,
                                                  AppLocalizations.of(context)!
                                                      .personalLinkSubtitle,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                          fontSize: FontList.font32),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      Theme.of(context).primaryColorDark,
                                                  border: BorderDirectional(
                                                    top: BorderSide(
                                                        color: ColorList
                                                            .generalWhite100AppFonts,
                                                        width: 1),
                                                    start: BorderSide(
                                                        color: ColorList
                                                            .generalWhite100AppFonts,
                                                        width: 1),
                                                    end: BorderSide(
                                                        color: ColorList
                                                            .generalWhite100AppFonts,
                                                        width: 1),
                                                  ),
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          FontList.font16),
                                                      topRight: Radius.circular(
                                                          FontList.font16)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(64, 0, 0, 0),
                                                      spreadRadius: 0,
                                                      blurRadius: 4,
                                                      offset: Offset(0, 2),
                                                    ),
                                                  ],
                                                ),
                                                padding: EdgeInsets.only(
                                                    top: FontList.font24,
                                                    left: FontList.font24,
                                                    right: FontList.font24,
                                                    bottom: FontList.font84),
                                                child: Column(
                                                  spacing: FontList.font16,
                                                  children: [
                                                    if (state.isLinkedInVisible)
                                                      CustomTextField(
                                                        textFieldLabel:
                                                            AppLocalizations.of(context)!
                                                                .linkedIn,
                                                        textFieldHint:
                                                            AppLocalizations.of(context)!
                                                                .linkedinHintText,
                                                        keypadType: TextInputType.text,
                                                        formSection:
                                                            AppLocalizations.of(context)!
                                                                .linkedIn,
                                                        onChanged: (value) {
                                                          bloc.add(OnFieldTextChanges(
                                                              value,
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .linkedIn,
                                                              context));
                                                        },
                                                        externalErrorText: state
                                                                .fieldErrorComponent
                                                                .any((error) =>
                                                                    error.containsKey(
                                                                        AppLocalizations.of(context)!
                                                                            .linkedIn))
                                                            ? state.fieldErrorComponent
                                                                    .firstWhere((error) =>
                                                                        error.containsKey(AppLocalizations.of(context)!.linkedIn))[
                                                                AppLocalizations.of(context)!
                                                                    .linkedIn]!
                                                            : '',
                                                      ),
                                                    if (state.isInstagramVisible)
                                                      CustomTextField(
                                                        textFieldLabel:
                                                            AppLocalizations.of(context)!
                                                                .instagram,
                                                        textFieldHint:
                                                            AppLocalizations.of(context)!
                                                                .instagramHintText,
                                                        keypadType: TextInputType.text,
                                                        formSection:
                                                            AppLocalizations.of(context)!
                                                                .instagram,
                                                        onChanged: (value) {
                                                          bloc.add(OnFieldTextChanges(
                                                              value,
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .instagram,
                                                              context));
                                                        },
                                                        externalErrorText: state
                                                                .fieldErrorComponent
                                                                .any((error) =>
                                                                    error.containsKey(
                                                                        AppLocalizations.of(context)!
                                                                            .instagram))
                                                            ? state.fieldErrorComponent
                                                                    .firstWhere((error) =>
                                                                        error.containsKey(AppLocalizations.of(context)!.instagram))[
                                                                AppLocalizations.of(context)!
                                                                    .instagram]!
                                                            : '',
                                                      ),
                                                    if (state.isWebsiteVisible)
                                                      CustomTextField(
                                                        textFieldLabel:
                                                            AppLocalizations.of(context)!
                                                                .website,
                                                        textFieldHint:
                                                            AppLocalizations.of(context)!
                                                                .websiteHintText,
                                                        keypadType: TextInputType.text,
                                                        formSection:
                                                            AppLocalizations.of(context)!
                                                                .website,
                                                        onChanged: (value) {
                                                          bloc.add(OnFieldTextChanges(
                                                              value,
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .website,
                                                              context));
                                                        },
                                                        externalErrorText: state
                                                                .fieldErrorComponent
                                                                .any((error) =>
                                                                    error.containsKey(
                                                                        AppLocalizations.of(context)!
                                                                            .website))
                                                            ? state.fieldErrorComponent
                                                                    .firstWhere((error) =>
                                                                        error.containsKey(AppLocalizations.of(context)!.website))[
                                                                AppLocalizations.of(context)!
                                                                    .website]!
                                                            : '',
                                                      ),
                                                    if (state.isProjectVisible)
                                                      CustomTextField(
                                                        textFieldLabel:
                                                            AppLocalizations.of(context)!
                                                                .project,
                                                        textFieldHint:
                                                            AppLocalizations.of(context)!
                                                                .projectHintText,
                                                        keypadType: TextInputType.text,
                                                        formSection:
                                                            AppLocalizations.of(context)!
                                                                .project,
                                                        onChanged: (value) {
                                                          bloc.add(OnFieldTextChanges(
                                                              value,
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .project,
                                                              context));
                                                        },
                                                        externalErrorText: state
                                                                .fieldErrorComponent
                                                                .any((error) =>
                                                                    error.containsKey(
                                                                        AppLocalizations.of(context)!
                                                                            .project))
                                                            ? state.fieldErrorComponent
                                                                    .firstWhere((error) =>
                                                                        error.containsKey(AppLocalizations.of(context)!.project))[
                                                                AppLocalizations.of(context)!
                                                                    .project]!
                                                            : '',
                                                      ),
                                                    Gap(FontList.font15),
                                                    GestureDetector(
                                                      onTap: () {
                                                        bloc.add(OnSubmitDataUrl(context));
                                                      },
                                                      child: CustomButton(
                                                          textButton: AppLocalizations.of(
                                                                  context)!
                                                              .continueText),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  )),
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
                                ],
                              );
          
                              return LayoutBuilder(builder: (context, constraints) {
                                return SingleChildScrollView(
                                    child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minHeight: constraints.maxHeight,
                                        ),
                                        child: IntrinsicHeight(child: content)));
                              });
                            })),
                      ),
                    ),
          );
        },
      ),
    );
  }
}
