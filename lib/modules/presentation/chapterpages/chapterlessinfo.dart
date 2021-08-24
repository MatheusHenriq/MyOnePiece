import 'package:flutter/material.dart';

class ChapterLessInfo extends StatelessWidget {
  final String title;
  final int chapter;
  final void Function() onTap;
  const ChapterLessInfo({
    Key key,
    this.title,
    this.chapter,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/onepiece50x50.png'),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Chapter: ',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextSpan(
                          text: '$chapter',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Title: ',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextSpan(
                          text: '$title',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
