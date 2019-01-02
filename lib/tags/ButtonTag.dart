import 'package:flutter/material.dart';
import 'package:flutter_mini_program/Page.dart';
import 'package:html/dom.dart' as dom;

/// Builds a icon from a <button> tag.
class ButtonTag extends StatelessWidget {
  final Page page;
  final dom.Element element;
  final Map style;

  ButtonTag({this.page, this.element, this.style});

  @override
  Widget build(BuildContext context) {
    assert(element.localName == 'button');

    String text = element.text;
    var attributes = element.attributes;
    var onTap = attributes['ontap'];

    switch (attributes['type']) {
      case 'close':
        return new CloseButton();
      case 'back':
        return new BackButton();
      case 'floating-action':
        return new FloatingActionButton(onPressed: () {
          page.invoke(onTap);
        });
        break;
      case 'icon':
        return new IconButton(
            icon: Icon(Icons.ac_unit),
            tooltip: text,
            onPressed: () {
              page.invoke(onTap);
            });
        break;
      case 'flat':
        return new FlatButton(
            // 字体颜色
            textColor: Colors.white,
            // 背景颜色
            color: Colors.blue,
            // 文字
            child: new Text(text),
            // 扁平化按钮
            onPressed: () {
              page.invoke(onTap);
            });
        break;
      case 'raised':
        return new RaisedButton(
            // 字体颜色
            textColor: Colors.white,
            // 背景颜色
            color: Colors.blue,
            // 波纹颜色
            splashColor: Colors.blueGrey,
            child: new Text(text),
            onPressed: () {
              page.invoke(onTap);
            });
        break;
      case 'raw-material':
        return new RawMaterialButton(
            child: new Text(text),
            onPressed: () {
              page.invoke(onTap);
            });
    }
  }
}
