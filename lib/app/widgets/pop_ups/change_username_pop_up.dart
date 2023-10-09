import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profanity_filter/profanity_filter.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../app/gen/l10n/l10n.dart';
import '../../../blocs/blocs.dart';
import '../../../features/settings/widgets/widgets.dart';

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
        if (oldUsername != null &&
            oldUsername != userState.userModel!.username) {
          popBack(context);
        }
        oldUsername = userState.userModel!.username;

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
                              ? L10n.current.notUnique
                              : L10n.current.enterUsername,
                          style: GoogleFonts.bangers(fontSize: 56),
                        ),
                        Padding(
                          padding: SharedPaddings.horizontal16,
                          child: GradientTextField(
                            hintText: L10n.current.username,
                            linearGradient: const LinearGradient(
                              colors: [
                                Colors.orange,
                                Colors.pink,
                              ],
                            ),
                            onChanged: (newUsernameValue) {
                              final filter = ProfanityFilter();

                              if (newUsernameValue.length < 3) {
                                errorText = L10n.current.usernameTooShortError;
                                setState(() {});
                                return;
                              }
                              if (newUsernameValue.length > 20) {
                                errorText = L10n.current.usernameTooLongError;
                                setState(() {});
                                return;
                              }
                              if (!RegExp(r'^[a-zA-Z0-9]+$')
                                  .hasMatch(newUsernameValue)) {
                                errorText =
                                    L10n.current.usernameHasSpecialCharsError;
                                setState(() {});
                                return;
                              }
                              if (filter.hasProfanity(newUsernameValue)) {
                                errorText =
                                    L10n.current.usernameHasBadWordsError;
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
                        if (userState.userModel?.username != '' &&
                            userState.userModel?.username == oldUsername)
                          Text(
                            L10n.current.usernameChangeLimitWarning,
                          ),
                      ],
                    ),
                  ),
                  GradientButton(
                    text: L10n.current.done,
                    onPressed: () async {
                      final canChangeUsername = userState
                          .userModel!.accountnameChangeEligibilityDate
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
