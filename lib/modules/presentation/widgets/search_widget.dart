import 'package:animatedcontroller/controllers/choose_chapter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key key,
    @required this.text,
    @required this.onChanged,
    @required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  ChooseChapterController controllerSearch = Get.put(ChooseChapterController());

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 35,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: TextField(
        autofocus: true,
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 3,
        decoration: InputDecoration(
          counterText: '',
          icon: Icon(Icons.search, color: style.color),
          isCollapsed: true,
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controllerSearch = controllerSearch.searchingToggle(null);
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle:
              Theme.of(context).textTheme.bodyText1.apply(color: Colors.black),
          border: InputBorder.none,
        ),
        style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.black),
        onChanged: widget.onChanged,
        onSubmitted: (String value) {
          if (value == '') {
            controllerSearch.searchingToggle(false);
          }
        },
      ),
    );
  }
}
