import 'package:flutter/material.dart';

final numberList = List.generate(10, (index) => "$index");

class NumberPad extends StatelessWidget {

  final Function(String) onChange;

  /// delete icon
  final Icon? icon;

  /// textStyle for number String
  final TextStyle? textStyle;

  /// shuffle number position
  static void shuffle() => numberList
    ..remove("")
    ..remove("del")
    ..shuffle()
    ..insert(9, "")
    ..insert(11, "del");

  NumberPad({
    Key? key,
    required this.onChange,
    this.icon,
    this.textStyle,
  }) : super(key: key);

  final defaultTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  String codeValue = "";

  @override
  Widget build(BuildContext context) {
    return _renderPad(context);
  }

  Widget _renderPad(context) => LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: ((constraints.maxWidth / 3) / 2) * 4,
          child: GridView.builder(
              itemCount: numberList.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 1,
              ),
              itemBuilder: (context, idx) {
                return _itemNumber(numberList[idx]);
              }),
        );
      });

  Widget _itemNumber(value) => InkWell(
        onTap: () {
          if (value == "") return;
          if (value == "del") {
            codeValue.substring(0, codeValue.length - 1);

            onChange(codeValue);
            return;
          }
          codeValue += value;

          onChange(codeValue);
        },
        child: Center(
          child: value == "del"
              ? icon ?? const Icon(Icons.arrow_back_ios_rounded)
              : Text(
                  value,
                  style: textStyle ?? defaultTextStyle,
                ),
        ),
      );
}
