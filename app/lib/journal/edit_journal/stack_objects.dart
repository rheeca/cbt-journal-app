import 'package:flutter/material.dart';
import 'package:stack_board/helpers.dart';
import 'package:stack_board/stack_board_item.dart';
import 'package:stack_board/widget_style_extension.dart';

class ColorContent extends StackItemContent {
  ColorContent({required this.color});

  Color color;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'color': color.value,
    };
  }

  factory ColorContent.fromJson(Map<String, dynamic> data) {
    return ColorContent(
      color: data['color'] == null ? Colors.black : Color(data['color']),
    );
  }
}

class ColorStackItem extends StackItem<ColorContent> {
  ColorStackItem({
    required super.size,
    super.id,
    super.offset,
    super.angle = null,
    super.status = null,
    super.content,
  }) : super(
          lockZOrder: true,
        );

  factory ColorStackItem.fromJson(Map<String, dynamic> data) {
    return ColorStackItem(
      size: jsonToSize(asMap(data['size'])),
      id: data['id'] == null ? null : asT<String>(data['id']),
      offset:
          data['offset'] == null ? null : jsonToOffset(asMap(data['offset'])),
      angle: data['angle'] == null ? null : asT<double>(data['angle']),
      status: StackItemStatus.values[data['status'] as int],
      content: ColorContent.fromJson(asMap(data['content'])),
    );
  }

  @override
  ColorStackItem copyWith({
    Size? size,
    Offset? offset,
    double? angle,
    StackItemStatus? status,
    bool? lockZOrder,
    ColorContent? content,
  }) {
    return ColorStackItem(
      id: id,
      size: size ?? this.size,
      offset: offset ?? this.offset,
      angle: angle ?? this.angle,
      status: status ?? this.status,
      content: content ?? this.content,
    );
  }
}
