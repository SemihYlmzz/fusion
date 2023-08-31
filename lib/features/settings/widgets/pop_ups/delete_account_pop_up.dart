import 'package:flutter/material.dart';
import 'package:fusion/features/delete_account/view/delete_account_screen.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

class DeleteAccountPopUp extends StatelessWidget {
  const DeleteAccountPopUp({required this.devicePrefs, super.key});
  final DevicePrefs devicePrefs;
  static const _warningText = 'If you delete this account';
  static const _deleteGradientButtonTitle = 'Delete';
  static const _cancelGradientButtonTitle = 'Cancel';
  static const String _text1 = 'The account is removed from your phone.';
  static const String _text2 =
      'In your accountyour edited decks of cards are deleted.';
  static const String _text3 =
      'Your match history and saved game settings will be reset';
  static const String _text4 =
      'You can continue to use the application by logging in to your account again within 30 days.';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      content: Container(
        constraints: const BoxConstraints(
          maxHeight: 533,
        ),
        child: RawScrollbar(
          thumbVisibility: true,
          interactive: false,
          thumbColor: Colors.redAccent,
          radius: const Radius.circular(20),
          thickness: 5,
          child: SingleChildScrollView(
            child: Padding(
              padding: SharedPaddings.all4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: SharedPaddings.bottom16,
                    child: Row(
                      children: [
                        Expanded(
                          child: Icon(
                            Icons.warning,
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            _warningText,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      _conditionsText(text: _text1),
                      _conditionsText(text: _text2),
                      _conditionsText(text: _text3),
                      _conditionsText(text: _text4),
                      Row(
                        children: [
                          Expanded(
                            child: GradientButton(
                              text: _deleteGradientButtonTitle,
                              width: 100,
                              onPressed: () {
                                Navigator.popUntil(
                                  context,
                                  (route) => route.isFirst,
                                );
                                // context.read<DeleteRequestBloc>().add(
                                // const CreateDeleteRequestRequested(),
                                // );
                                context.goNamed(
                                  DeleteAccountScreen.name,
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: GradientButton(
                              text: _cancelGradientButtonTitle,
                              width: 100,
                              isOutlined: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Diğer dilleri benzer şekilde ekleyebilirsiniz.
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _conditionsText({
    required String text,
  }) {
    return Padding(
      padding: SharedPaddings.bottom16,
      child: Row(
        children: [
          Expanded(
            child: Text(
              '\u2022 $text',
            ),
          ),
        ],
      ),
    );
  }
}
