import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profanity_filter/profanity_filter.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../features/settings/widgets/widgets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';

class EnterNamePopUp extends StatefulWidget {
  const EnterNamePopUp({super.key});

  @override
  State<EnterNamePopUp> createState() => _EnterNamePopUpState();
}

class _EnterNamePopUpState extends State<EnterNamePopUp> {
  String? oldUsername;
  String? errorText;
  String newUsername = '';
  final nonUniqueUsernamesList = <String>[];

  double isAnimationPlaying = 0;

  Future<void> popBack(BuildContext context) async {
    await Future<void>.delayed(Duration.zero);
    if (mounted) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        if (oldUsername != null && oldUsername != userState.user!.username) {
          popBack(context);
        }
        oldUsername = userState.user!.username;

        if (!nonUniqueUsernamesList.contains(oldUsername)) {
          nonUniqueUsernamesList.add(oldUsername ?? '');
        }
        return LoadingScreen(
          isLoading: userState is UserLoading,
          size: MediaQuery.of(context).size,
          child: ClosableAnimatedScaffold(
            backgroundColor: Colors.black87,
            child: GestureDetector(
              onTap: () {
                if (mounted) {
                  Navigator.pop(context);
                }
              },
              child: BaseColumn(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Animate(
                    effects: const [ShakeEffect()],
                    target: isAnimationPlaying,
                    onComplete: (controller) {
                      isAnimationPlaying = 0;

                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Text(
                          isAnimationPlaying > 0
                              ? AppLocalizations.of(context).notUnique
                              : AppLocalizations.of(context).enterUsername,
                          style: GoogleFonts.bangers(fontSize: 56),
                        ),
                        Padding(
                          padding: SharedPaddings.horizontal16,
                          child: GradientTextField(
                            hintText: AppLocalizations.of(context).username,
                            linearGradient: const LinearGradient(
                              colors: [
                                Colors.orange,
                                Colors.pink,
                              ],
                            ),
                            onChanged: (newUsernameValue) {
                              final filter = ProfanityFilter();

                              if (newUsernameValue.length < 3) {
                                errorText = AppLocalizations.of(context)
                                    .usernameTooShortError;
                                setState(() {});
                                return;
                              }
                              if (newUsernameValue.length > 20) {
                                errorText = AppLocalizations.of(context)
                                    .usernameTooLongError;
                                setState(() {});
                                return;
                              }
                              if (!RegExp(r'^[a-zA-Z0-9]+$')
                                  .hasMatch(newUsernameValue)) {
                                errorText = AppLocalizations.of(context)
                                    .usernameHasSpecialCharsError;
                                setState(() {});
                                return;
                              }
                              if (filter.hasProfanity(newUsernameValue)) {
                                errorText = AppLocalizations.of(context)
                                    .usernameHasBadWordsError;
                                setState(() {});
                                return;
                              }
                              errorText = null;
                              newUsername = newUsernameValue;
                              setState(() {});
                            },
                            errorText: errorText,
                          ),
                        ),
                        if (userState.user?.username != '' &&
                            userState.user?.username == oldUsername)
                          Text(
                            AppLocalizations.of(context)
                                .usernameChangeLimitWarning,
                          ),
                      ],
                    ),
                  ),
                  GradientButton(
                    text: AppLocalizations.of(context).done,
                    onPressed: () async {
                      final canChangeUsername = userState
                          .user!.accountnameChangeEligibilityDate
                          .isBefore(DateTime.now());
                      if ((newUsername == '' || !canChangeUsername) &&
                          mounted) {
                        await popBack(context);
                        return;
                      }
                      if (nonUniqueUsernamesList.contains(newUsername)) {
                        isAnimationPlaying = 1.0;
                        setState(() {});

                        return;
                      }
                      if (errorText == null && newUsername != '') {
                        FocusScope.of(context).unfocus();
                        context
                            .read<UserBloc>()
                            .add(ChangeUsernameRequested(newUsername));
                        nonUniqueUsernamesList.add(newUsername);
                        return;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
