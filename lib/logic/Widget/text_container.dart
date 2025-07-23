import 'package:bildergalerie/logic/style/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
    required,
    this.textDate,
    this.textTitle,
    required this.text,
  });

  final String text;
  final String? textDate;
  final String? textTitle;

  @override
  Widget build(BuildContext context) {
    final style = Provider.of<StyleManager>(context).style;

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: style.textBox,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 5,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textTitle != null
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Text(textTitle!, style: style.textTitle),
                    )
                  : const SizedBox.shrink(),
              textDate != null
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        textDate!,
                        style: style.textItalic,
                        textAlign: TextAlign.right,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),

          Text(text, style: style.textBasis),

          const SizedBox(height: 10),
          textDate != null
              ? Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "vor ${daysAfterWritten(textDate!)} Tage geschrieben",
                    style: style.textItalic,
                    textAlign: TextAlign.right,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  String daysAfterWritten(String date) {
    String daysAgo = "";

    DateTime parsedDate = DateTime.parse(date.split('.').reversed.join('-'));

    DateTime today = DateTime.now();
    DateTime todayDateOnly = DateTime(today.year, today.month, today.day);

    Duration difference = todayDateOnly.difference(parsedDate);

    daysAgo = difference.inDays.toString();

    return daysAgo;
  }
}
