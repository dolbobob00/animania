import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.label,
    this.icon,
    this.isPassword = false,
    this.onChanged,
    this.maxLength,
  });

  final String? label;
  final IconData? icon;
  final bool isPassword;
  final void Function(String)? onChanged;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        obscureText: isPassword,
        maxLength: maxLength,
        // Если задан maxLength, то добавляем ограничение на ввод
        inputFormatters: maxLength != null 
            ? [
                LengthLimitingTextInputFormatter(maxLength),
              ]
            : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          // Показываем счетчик только если задан maxLength
          counterText: maxLength != null ? null : '',
        ),
        onChanged: onChanged,
      ),
    );
  }
}
