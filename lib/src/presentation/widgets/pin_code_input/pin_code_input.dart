import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../configs/app_colors.dart';

class PinCodeInput extends StatefulWidget {
  const PinCodeInput({
    super.key,
    this.onCompleted,
    this.length = 4,
  });

  final Function(String)? onCompleted;
  final int length;

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(
      widget.length,
      (index) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (_controllers.every((controller) => controller.text.isNotEmpty)) {
      final code = _controllers.map((c) => c.text).join();
      widget.onCompleted?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: 50,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: "",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 3,
                ),
              ),
            ),
            style: theme.textTheme.headlineSmall,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) => _onChanged(value, index),
          ),
        ),
      ),
    );
  }
}
