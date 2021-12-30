import 'package:flutter/material.dart';

enum Marchio { notDefined, eni, esso, kerotris, oilItalia, q8, tamoil }

extension MarchioExtension on Marchio {
  Image get image {
    return Image.asset('assets/images/marchi/${name}.jpg');
  }
}
