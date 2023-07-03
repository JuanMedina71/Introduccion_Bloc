import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage,
    this.validator, 
    this.onChanged, 
    this.obscureText = false, 
    });

  @override
  Widget build(BuildContext context) {

      final colors = Theme.of(context).colorScheme;

      final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(40)
      );

     return TextFormField(
      onChanged: onChanged,
      validator:  validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)) ,
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText:  errorMessage,
        focusColor: colors.primary,
        suffixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary)

      ),

     );
  
  }
}


