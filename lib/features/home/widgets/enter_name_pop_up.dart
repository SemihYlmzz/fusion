import 'package:flutter/material.dart';
import 'package:fusion/features/settings/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profanity_filter/profanity_filter.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

class EnterNamePopUp extends StatelessWidget {
  const EnterNamePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    String? errorText;
    var newUsername = '';
    return ClosableAnimatedScaffold(
      backgroundColor: Colors.black87,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: BaseColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              children: [
                Text(
                  'ENTER A USERNAME',
                  style: GoogleFonts.bangers(fontSize: 56),
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Padding(
                      padding: SharedPaddings.horizontal16,
                      child: GradientTextField(
                        hintText: 'Username',
                        linearGradient: const LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.pink,
                          ],
                        ),
                        onChanged: (newUsernameValue) {
                          final filter = ProfanityFilter();

                          if (newUsernameValue.length < 3) {
                            errorText = 'Username too short';
                            setState(() {});
                            return;
                          }
                          if (newUsernameValue.length > 20) {
                            errorText = 'Username too long';
                            setState(() {});
                            return;
                          }
                          if (!RegExp(r'^[a-zA-Z0-9]+$')
                              .hasMatch(newUsernameValue)) {
                            errorText = 'No special characters.';
                            setState(() {});
                            return;
                          }
                          if (filter.hasProfanity(newUsernameValue)) {
                            errorText = 'Has bad words.';
                            setState(() {});
                            return;
                          }
                          errorText = null;
                          newUsername = newUsernameValue;
                          setState(() {});
                        },
                        errorText: errorText,
                      ),
                    );
                  },
                ),
              ],
            ),
            GradientButton(
              text: 'DONE',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
