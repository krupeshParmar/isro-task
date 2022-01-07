import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  final String optionName, optionValue;
  final int id, selectedId;

  const OptionsScreen(
      {required this.optionName,
      required this.optionValue,
      required this.id,
      required this.selectedId});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(style: BorderStyle.solid),
        color: selectedId == id ? Colors.green : Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(optionName,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: selectedId == id ? Colors.white : Colors.black)),
            ),
            Expanded(
              flex: 10,
              child: Text(optionValue,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: selectedId == id ? Colors.white : Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
