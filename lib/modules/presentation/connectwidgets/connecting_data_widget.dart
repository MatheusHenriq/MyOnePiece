import 'package:flutter/material.dart';

class ConnectingData extends StatelessWidget {
  const ConnectingData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Loading Chapters...',
            style: Theme.of(context)
                .textTheme
                .headline3
                .apply(color: Theme.of(context).hintColor),
          ),
        ],
      ),
    );
  }
}
