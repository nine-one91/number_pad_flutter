import 'package:flutter/material.dart';

final numberList = List.generate(10, (index) => "$index");

class NumberPad extends StatefulWidget {
  final Function(String) onChange;

  /// delete icon
  final Icon? icon;

  /// textStyle for number String
  final TextStyle? textStyle;

  final Color? backgroundColor;

  final Color? borderColor;

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
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  @override
  State<NumberPad> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  final defaultTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  late String codeValue;

  @override
  void initState() {
    super.initState();
    codeValue = "";
  }
  @override
  Widget build(BuildContext context) {
    return _renderPad(context);
  }

  Widget _renderPad(context) => LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.transparent,
          ),
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
                return Container(
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(
                          color: widget.borderColor ?? Colors.transparent),
                      left: BorderSide(
                        color: widget.borderColor ?? Colors.transparent,
                        width: [1, 4, 7, 10].contains(idx) ? 0 : 1,
                      ),
                      right: BorderSide(
                        color: widget.borderColor ?? Colors.transparent,
                        width: [1, 4, 7, 10].contains(idx) ? 0 : 1,
                      ),
                      bottom: BorderSide(
                          color: widget.borderColor ?? Colors.transparent,
                          width: [9, 10, 11].contains(idx) ? 1 : 0),
                    )),
                    child: _itemNumber(numberList[idx]));
              }),
        );
      });

  Widget _itemNumber(value) => InkWell(
        onTap: () {
          if (value == "" ) return;
          if (value == "del" && codeValue.isNotEmpty) {
            codeValue = codeValue.substring(0, codeValue.length - 1);
            widget.onChange(codeValue);
            return;
          } else if (value != "del") {
            codeValue += value;
            widget.onChange(codeValue);
          }

        },
        child: Center(
          child: value == "del"
              ? widget.icon ?? const Icon(Icons.arrow_back_ios_rounded)
              : Text(
                  value,
                  style: widget.textStyle ?? defaultTextStyle,
                ),
        ),
      );
}
