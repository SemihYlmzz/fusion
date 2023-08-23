import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/settings/widgets/widgets.dart';
import 'package:fusion/l10n/app_localizations.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

class CantRenamePopUp extends StatefulWidget {
  const CantRenamePopUp({super.key});

  @override
  State<CantRenamePopUp> createState() => _CantRenamePopUpState();
}

class _CantRenamePopUpState extends State<CantRenamePopUp> {
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
        final month = userState.user!.accountnameChangeEligibilityDate
            .difference(DateTime.now());

        return ClosableAnimatedScaffold(
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
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: SharedBorderRadius.circular16,
                  ),
                  padding: SharedPaddings.vertical32,
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context).cantRenameYet,
                        style: GoogleFonts.bangers(fontSize: 40),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${month.inHours}',
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.redAccent,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context).hoursText,
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        AppLocalizations.of(context).youShouldWait,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                ),
                GradientButton(
                  text: AppLocalizations.of(context).done,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
