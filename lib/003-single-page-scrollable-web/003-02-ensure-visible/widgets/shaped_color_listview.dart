import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulusoyapps_flutter/002-navigator-2/entity/shape_border_type.dart';
import 'package:ulusoyapps_flutter/003-single-page-scrollable-web/003-02-ensure-visible/widgets/shape_border_gridview.dart';
import 'package:ulusoyapps_flutter/extensions/color_extensions.dart';

class ShapedColorList extends StatefulWidget {
  final List<Color> colors;
  final ValueNotifier<ShapeBorderType> selectedShapeBorderType;
  final ValueNotifier<double> scrollPosition;
  final ValueListenable<String> selectedColorCode;

  const ShapedColorList({
    Key key,
    @required this.colors,
    @required this.selectedShapeBorderType,
    @required this.scrollPosition,
    @required this.selectedColorCode,
  }) : super(key: key);

  @override
  _ShapedColorListState createState() => _ShapedColorListState();
}

class _ShapedColorListState extends State<ShapedColorList> {
  ScrollController _scrollController;

  int get selectedColorCodeIndex {
    int index = widget.colors.indexWhere((element) => element.toHex() == widget.selectedColorCode.value);
    return index > -1 ? index : 0;
  }

  List<GlobalKey> keys;

  @override
  void initState() {
    keys = [for (int i = 0; i < widget.colors.length; i++) GlobalKey()];
    _scrollController = ScrollController(initialScrollOffset: widget.scrollPosition.value);
    _scrollController.addListener(() {
      widget.scrollPosition.value = _scrollController.position.pixels;
    });
    widget.selectedColorCode.addListener(() {
      if (_scrollController.hasClients) {
        _scrollToSelectedColor();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          for (int i = 0; i < widget.colors.length; i++)
            Column(
              children: [
                _section(context, i),
                Divider(thickness: 4),
              ],
            )
        ],
      ),
    );
  }

  Widget _section(BuildContext context, int index) {
    final color = widget.colors[index];
    return Padding(
      key: keys[index],
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: index * 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(color.toHex(leadingHashSign: true), style: Theme.of(context).textTheme.headline4),
          ),
          ShapeBorderGridView(
            sectionColor: color,
            selectedColorCode: widget.selectedColorCode,
            selectedShapeBorderType: widget.selectedShapeBorderType,
          ),
        ],
      ),
    );
  }

  void _scrollToSelectedColor() {
    Scrollable.ensureVisible(
      keys[selectedColorCodeIndex].currentContext,
      duration: Duration(milliseconds: selectedColorCodeIndex * 100),
      curve: Curves.easeInOut,
    );
  }
}
