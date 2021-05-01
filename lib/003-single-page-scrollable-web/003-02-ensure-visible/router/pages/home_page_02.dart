/*
 * Copyright 2020 Cagatay Ulusoy (Ulus Oy Apps). All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulusoyapps_flutter/002-navigator-2/entity/shape_border_type.dart';

import '../../home_screen_02.dart';

class HomePage extends Page {
  final List<Color> colors;
  final ValueListenable<ShapeBorderType> selectedShapeBorderType;
  final ValueListenable<String> selectedColorCode;
  final ValueNotifier<double> scrollPosition;

  HomePage({
    this.colors,
    this.selectedShapeBorderType,
    this.selectedColorCode,
    this.scrollPosition,
  }) : super(key: ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen(
          colors: colors,
          selectedColorCode: selectedColorCode,
          selectedShapeBorderType: selectedShapeBorderType,
          scrollPosition: scrollPosition,
        );
      },
    );
  }
}
