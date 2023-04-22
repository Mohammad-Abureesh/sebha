import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double space;
  final bool _isVertical;
  final bool _forceSquare;

  /// To return [SizedBox] widget by default vertical space
  /// you need horizontal space use [Space.horizontal] or set
  /// [isVertical] to false
  const Space({required this.space, bool? isVertical, Key? key})
      : _isVertical = isVertical ?? true,
        _forceSquare = false,
        super(key: key);

  ///To return [SizedBox]  vertical space
  const Space.vertical(this.space, {Key? key})
      : _isVertical = true,
        _forceSquare = false,
        super(key: key);

  ///To return [SizedBox]  horizontal space
  const Space.horizontal(this.space, {Key? key})
      : _isVertical = false,
        _forceSquare = false,
        super(key: key);

  ///To add empty space
  const Space.empty({Key? key})
      : _isVertical = false,
        _forceSquare = false,
        space = 0.0,
        super(key: key);

  ///To add square space h & v space
  const Space.square(this.space, {Key? key})
      : _isVertical = false,
        _forceSquare = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_forceSquare) return _squareSpace;
    return _isVertical ? _vSpace : _hSpace;
  }

  Widget _box({double? w, double? h}) => SizedBox(width: w, height: h);

  Widget get _vSpace => _box(h: space);
  Widget get _hSpace => _box(w: space);
  Widget get _squareSpace => _box(w: space, h: space);
} //end Space Widget
