import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../widgets/key_pad.dart';

// un widget con estado en el cual mantenemos los dos indices
// de las monedas que vamos a convertir
class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  // el estado del widget
  int currency1 = 1;
  int currency2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Currency converter')
        ),
        body: Container(
            padding: const EdgeInsets.only(top: 0.0, bottom: 10.0),
            //child: KeyPad(textCurrency1: currencies[currency1], textCurrency2: currencies[currency2], rate: rates[currency1][currency2])
            child: KeyPad()
        )
    );
  }
}
