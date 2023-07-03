import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class GradientTextField extends StatefulWidget {
  final double? width;
  final bool readOnly;
  final int? maxLines;
  final Function(String)? onSubmitted;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String hintText;
  final String? errorText;
  final TextStyle? labelTextStyle;
  final LinearGradient linearGradient;
  final void Function(String)? onChanged;
  const GradientTextField({
    super.key,
    this.width,
    this.readOnly = false,
    this.maxLines,
    this.onSubmitted,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.errorText,
    this.labelTextStyle,
    required this.hintText,
    required this.linearGradient,
    required this.onChanged,
  });

  @override
  State<GradientTextField> createState() => _GradientTextFieldState();
}

class _GradientTextFieldState extends State<GradientTextField> {
  late bool obscureText;
  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  String fixDate(String tarih) {
    List<String> parcalar = tarih.split('-');
    String gun = '';
    String ay = '';
    String yil = '';

    // Günü düzeltme
    if (parcalar.isNotEmpty) {
      gun = parcalar[0];
      if (gun.length == 2) {
        int gunInt = int.parse(gun);
        if (gunInt < 1) {
          gun = '01';
        } else if (gunInt > 31) {
          gun = '31';
        }
      }
    }

    // Ayı düzeltme
    if (parcalar.length > 1) {
      ay = parcalar[1];
      if (ay.length == 2) {
        int ayInt = int.parse(ay);
        if (ayInt < 1) {
          ay = '01';
        } else if (ayInt > 12) {
          ay = '12';
        }
      }
    }

    // Yıl
    if (parcalar.length > 2) {
      yil = parcalar[2];
    }

    return '$gun${ay.isNotEmpty ? '-' : ''}$ay${yil.isNotEmpty ? '-' : ''}$yil';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: TextField(
          maxLines: widget.maxLines ?? 1,
          autofocus: false,
          obscureText: obscureText,
          keyboardType: widget.keyboardType,
          cursorColor: Theme.of(context).primaryColorDark,
          decoration: InputDecoration(
            errorText: widget.errorText,
            suffixIcon: (widget.obscureText)
                ? GestureDetector(
                    onTap: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    child: Container(
                      width: 70,
                      color: Colors.transparent,
                      child: Icon(
                        Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  )
                : null,
            labelStyle: (widget.labelTextStyle ?? const TextStyle()).copyWith(
              color: Theme.of(context).primaryColorDark,
            ),
            // AppTextStyles.labelLarge.
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            labelText: widget.hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: GradientOutlineInputBorder(
              gradient: widget.linearGradient,
              width: 2,
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 1,
              ),
            ),
            focusedErrorBorder: GradientOutlineInputBorder(
              gradient: widget.linearGradient,
              width: 2,
            ),
          ),
          focusNode: widget.focusNode,
          enableSuggestions: false,
          onChanged: (String newValue) {
            widget.onChanged?.call(newValue);
          },
          readOnly: widget.readOnly,
        ),
      ),
    );
  }
}
