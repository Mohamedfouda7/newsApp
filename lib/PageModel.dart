import "package:flutter/material.dart";

class PageModel {
  String _images;
  IconData _icons;
  String _titles;
  Color _colors;
  int _indec=0;
 // bool _checkindic;

  PageModel(
      this._icons, this._colors, this._images, this._titles,

      ){
    this._indec+=1;
  }
  Color get colors => _colors;

  set colors(Color value) {
    _colors = value;
  }

  String get titles => _titles;

  set titles(String value) {
    _titles = value;
  }

  IconData get icons => _icons;

  set icons(IconData value) {
    _icons = value;
  }

  String get images => _images;

  set images(String value) {
    _images = value;
  }

  int get indec => _indec;

  set indec(int value) {
    _indec = value;
  }


}
