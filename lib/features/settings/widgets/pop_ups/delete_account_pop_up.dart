import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/delete_account/view/delete_account_screen.dart';
import 'package:fusion/features/settings/widgets/delete_acceptance.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../app/gen/l10n/l10n.dart';
import '../../../../blocs/blocs.dart';
import '../../../../repositories/repositories.dart';

class DeleteAccountPopUp extends StatefulWidget {
  const DeleteAccountPopUp({required this.devicePrefs, super.key});
  final DevicePrefsModel devicePrefs;
  static const _warningText = 'If you delete this account';
  static const _deleteGradientButtonTitle = 'Delete';
  static const String _text1 = 'The account is removed from your phone.';
  static const String _text2 =
      'In your accountyour edited decks of cards are deleted.';
  static const String _text3 =
      'Your match history and saved game settings will be reset';
  static const String _text4 =
      'You can continue to use the application by logging in '
      'to your account again within 30 days.';

  @override
  State<DeleteAccountPopUp> createState() => _DeleteAccountPopUpState();
}

class _DeleteAccountPopUpState extends State<DeleteAccountPopUp> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          MediaQuery.sizeOf(context).width < 340 ? SharedPaddings.all4 : null,
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
                          DeleteAccountPopUp._warningText,
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
                    _conditionsText(text: DeleteAccountPopUp._text1),
                    _conditionsText(text: DeleteAccountPopUp._text2),
                    _conditionsText(text: DeleteAccountPopUp._text3),
                    _conditionsText(text: DeleteAccountPopUp._text4),
                    DeleteAcceptance(
                      onAccept: ({bool? value}) {
                        setState(() {
                          _isAccepted = value ?? false;
                        });
                      },
                      isAccepted: _isAccepted,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _isAccepted
                              ? GradientButton(
                                  text: DeleteAccountPopUp
                                      ._deleteGradientButtonTitle,
                                  width: 100,
                                  onPressed: () {
                                    Navigator.popUntil(
                                      context,
                                      (route) => route.isFirst,
                                    );
                                    context.read<DeleteRequestBloc>().add(
                                          const CreateDeleteRequestRequested(),
                                        );
                                    context.goNamed(
                                      DeleteAccountScreen.name,
                                    );
                                  },
                                )
                              : const GradientButton(
                                  text: DeleteAccountPopUp
                                      ._deleteGradientButtonTitle,
                                  width: 100,
                                  isOutlined: true,
                                ),
                        ),
                        Expanded(
                          child: GradientButton(
                            text: L10n.current.cancel,
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

class DeleteCheckBox extends StatefulWidget {
  const DeleteCheckBox({required this.isCheck, super.key});
  final bool isCheck;
  @override
  State<DeleteCheckBox> createState() => _DeleteCheckBoxState();
}

class _DeleteCheckBoxState extends State<DeleteCheckBox> {
  bool changeableIsCheck = false;
  @override
  void initState() {
    changeableIsCheck = widget.isCheck;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: changeableIsCheck,
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              changeableIsCheck = value;
            });
          },
        ),
        const Expanded(
          child: Text(
            'Are you sure you want to delete the account?',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
