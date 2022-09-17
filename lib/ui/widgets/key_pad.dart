import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';

import '../themes/app_theme.dart';
import 'package:f_currency_converter_template/utils/constants.dart';
import 'package:f_currency_converter_template/ui/widgets/selection_item.dart';
import 'one_key.dart';

// en este widget mostramos el keypad y los valores de las monedas
class KeyPad extends StatefulWidget {
  const KeyPad({Key? key }) : super(key: key);

  // estos tres valores son recibidos de converter_page
  //String textCurrency1;
  //String textCurrency2;
  //double rate;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  int _currency1Selected = 0;
  int _currency2Selected = 0;
  double _currency2 = 0;
  double _currency1 = 0;
  double _rate = 0;
  String _currencyString = "0";

  void _cleanKeyPad() {
    _currency1 = 0;
    _currency2 = 0;
    _currencyString = "0";
  }

  void _assign() {
    _rate = rates[_currency1Selected][_currency2Selected];

    _currency1 = double.parse(_currencyString);
    _currency2 = _currency1 * _rate;
  }

  void _onPressed(int key) {
    setState(() {
      switch (key) {
        case 10: _cleanKeyPad();
          break;
      /*case 11:
          {
            if (_currencyString.isNotEmpty && _currencyString != "0") {
              _currencyString = _currencyString.substring(0, _currencyString.length - 1);
              _currencyString = _currencyString.isEmpty ? "0" : _currencyString;
              _assign();
            } else {
              _cleanKeyPad();
            }
          }
          break;*/
        default:
          {
            if (_currencyString.length < 12) {
              _currencyString += key == 11 ? "." : key.toString();
              _assign();
            }
          }
          break;
      }
    });
  }

  List<Widget> _buildItems() => currencies.map((val) => SelectionItem(title: val)).toList();

  Widget _buttonClear({required int number, required Widget child}) {
    return Expanded(
        flex: 1,
        child: MaterialButton(
            key: const Key("reset"),
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            onPressed: () => _onPressed(number),
            child: child)
    );
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    _cleanKeyPad();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          color: AppTheme.colorPrimary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //currency1
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: DirectSelect(
                            itemExtent: 45.0,
                            selectedIndex: 0,
                            backgroundColor: AppTheme.colorPrimary,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                _currency1Selected = index ?? 0;
                                _assign();
                              });
                            },
                            items: _buildItems(),
                            child: SelectionItem(
                              isForList: false,
                              title: currencies[_currency1Selected],
                            )
                        )
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              _currency1.toStringAsFixed(2),
                              style: AppTheme.textStyleMoney,
                            )
                        )
                    ),
                  ],
                ),
              ),

              //currency2
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Text(widget.textCurrency1),
                    Expanded(
                        flex: 1,
                        child: DirectSelect(
                            itemExtent: 45.0,
                            selectedIndex: 0,
                            backgroundColor: AppTheme.colorPrimary,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                _currency2Selected = index ?? 0;
                                _assign();
                              });
                            },
                            items: _buildItems(),
                            child: SelectionItem(
                              isForList: false,
                              title: currencies[_currency2Selected],
                            ))),
                    Expanded(
                        flex: 2,
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              _currency2.toStringAsFixed(2),
                              textAlign: TextAlign.right,
                              style: AppTheme.textStyleMoney,
                            )
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      //Numbers
      Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    OneKey(number: 7, callback: _onPressed),
                    OneKey(number: 8, callback: _onPressed),
                    OneKey(number: 9, callback: _onPressed),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      OneKey(number: 4, callback: _onPressed),
                      OneKey(number: 5, callback: _onPressed),
                      OneKey(number: 6, callback: _onPressed)
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      OneKey(number: 1, callback: _onPressed),
                      OneKey(number: 2, callback: _onPressed),
                      OneKey(number: 3, callback: _onPressed)
                    ]),
                Row(children: <Widget>[
                  _buttonClear(
                      number: 10,
                      child: Text("C", style: AppTheme.textStyleClean)
                  ),
                  OneKey(number: 0, callback: _onPressed),
                  //_buttonClear(number: 11, child: const Icon(Icons.backspace_outlined))
                  _buttonClear(number: 11, child: const Text("."))
                ])
              ],
            ),
          ))
    ]);
  }
}
