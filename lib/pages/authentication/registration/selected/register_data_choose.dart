import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:identity/pages/authentication/registration/selected/register_data_selected_bloc.dart';
import 'package:identity/data/section_data_items.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/repository/selected_data_repository.dart';
import 'package:identity/resources/font_config.dart';
import 'package:identity/services/selected_page_service.dart';
import 'package:identity/widgets/custom_button.dart';
import 'package:identity/widgets/custom_button_choosen.dart';

class RegisterDataChoose extends StatefulWidget {
  const RegisterDataChoose({super.key});

  @override
  State<RegisterDataChoose> createState() => _RegisterDataChooseState();
}

class _RegisterDataChooseState extends State<RegisterDataChoose> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double maxWidth = kIsWeb
        ? (width <= 600
            ? width
            : width * 0.6 <= 550
                ? 500
                : width * 0.6)
        : width;

    return BlocProvider(
      create: (context) => RegisterDataSelectedBloc(),
      child: BlocConsumer<RegisterDataSelectedBloc, RegisterDataSelectedState>(
        listener: (context, state) {
          if (!state.isLoading && state.isChooseDataDone) {
            final selectedPageService = SelectedPageService();
            final dataRepository = SelectedDataRepository(selectedPageService);

            if (mounted) {
              dataRepository.selectedPageService.checkNextPage(context);
            }
          }
        },
        builder: (context, state) {
          var bloc = context.read<RegisterDataSelectedBloc>();
          return Scaffold(
            body: Center(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: FontList.font24,
                      left: FontList.font24,
                      right: FontList.font24,
                      bottom: 64,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: FontList.font24),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  AppLocalizations.of(context)!
                                      .registerDataChooseTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: FontList.font24,
                                      ),
                                ),
                                Gap(FontList.font24),
                                Text(
                                  textAlign: TextAlign.center,
                                  AppLocalizations.of(context)!
                                      .registerDataChooseSubTitile,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: FontList.font16,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Center(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: GridView.builder(
                                  padding: EdgeInsets.only(top: 53),
                                  shrinkWrap: true,
                                  physics: kIsWeb
                                      ? AlwaysScrollableScrollPhysics()
                                      : NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: FontList.font24,
                                    mainAxisSpacing: FontList.font22,
                                    childAspectRatio: 1.0,
                                  ),
                                  itemCount: sectionItemData.length,
                                  itemBuilder: (context, index) {
                                    final item = sectionItemData[index];
                                    final isSelected =
                                        state.selectedItems.contains(item);
                                    return GestureDetector(
                                      onTap: () {
                                        bloc.add(SelectedDataChooseItem(item));
                                      },
                                      child: CustomButtonChoosen(
                                        textButton: item.sectionName,
                                        iconPath: item.iconPath,
                                        isSelected: isSelected,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: FontList.font24),
                          child: GestureDetector(
                            onTap: () {
                              bloc.add(SaveSelectedDataChoose());
                            },
                            child: CustomButton(
                                textButton:
                                    AppLocalizations.of(context)!.continueText),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
