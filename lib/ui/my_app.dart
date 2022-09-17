import 'package:flutter/material.dart';
import 'pages/converter_page.dart';

import 'package:f_currency_converter_template/ui/themes/app_theme.dart';

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({Key? key}) : super(key: key);

  // aquí agregamos el MaterialApp al árbol de widgets
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency Converter',
        theme: AppTheme.theme,
        home: const ConverterPage()
    );
  }
}
