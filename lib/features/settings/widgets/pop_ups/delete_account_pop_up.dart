import 'package:flutter/material.dart';
import 'package:fusion/features/delete_account/view/delete_account_screen.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

class DeleteAccountPopUp extends StatelessWidget {
  const DeleteAccountPopUp({required this.devicePrefs, super.key});
  final DevicePrefs devicePrefs;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: SharedPaddings.all8,
      content: Container(
        constraints: const BoxConstraints(
          maxHeight: 320,
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
                const Text('Are you shure to delete account ?'),
                Row(
                  children: [
                    Expanded(
                      child: GradientButton(
                        text: 'YES',
                        width: 100,
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                          // context.read<DeleteRequestBloc>().add(
                          // const CreateDeleteRequestRequested(),
                          // );
                          context.goNamed(
                            DeleteAccountScreen.name,
                          );
                        },
                      ),
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
}
