import 'package:f_currency_converter_template/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class OneKey extends StatelessWidget {
  const OneKey({Key? key, required this.number, required this.callback})
      : super(key: key);

  final int number;
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    // TODO.
    return Expanded(
      flex: 1,
      child: MaterialButton(
          textColor: AppTheme.colorBlack,
          key: Key(number.toString()),
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          onPressed: () => callback(number),
          child: Text(number.toString()),
      ),
    );
  }
}
