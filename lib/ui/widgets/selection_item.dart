import 'package:f_currency_converter_template/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const SelectionItem({super.key, required this.title, this.isForList = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: isForList ? _buildItem(context, Alignment.center) /*Padding(
              child: _buildItem(context),
              padding: const EdgeInsets.all(0.0),
            )*/
          : Card(
        elevation: 0,
        color: AppTheme.colorPrimary,
        //margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.keyboard_arrow_down_sharp, color: AppTheme.colorWhite),
            ),
            _buildItem(context, Alignment.centerLeft),
          ],
        ),
      ),
    );
  }

  _buildItem(BuildContext context, Alignment alignment) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //margin: const EdgeInsets.only(right: 8.0),
      //alignment: Alignment.centerLeft,
      alignment: alignment,
      child: Text(title, style: AppTheme.textStyleCurrency),
    );
  }
}