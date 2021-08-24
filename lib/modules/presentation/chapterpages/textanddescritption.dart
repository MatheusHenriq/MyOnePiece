import 'package:flutter/material.dart';

class TextAndDescription extends StatelessWidget {
  final String textAbove;
  final String textBelow;
  const TextAndDescription({
    Key key,
    this.textAbove,
    this.textBelow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            textAbove,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            textBelow,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
