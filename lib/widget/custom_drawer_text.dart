import 'package:flutter/material.dart';

class CustomDrawerText extends StatelessWidget {
  const CustomDrawerText({super.key, required this.isHeadLine, this.isLogOut, required this.text});
  final bool isHeadLine;
  final bool? isLogOut;
  final String text;

  @override
  Widget build(BuildContext context) {
    final headline = Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
    final option = Text(text, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w400));
    final logOut = Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w400, color: Colors.red),
    );

    if (isLogOut == true) {
      return logOut;
    } else if (isHeadLine == true) {
      return headline;
    } else {
      return option;
    }
  }
}
