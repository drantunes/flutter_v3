import 'package:flutter/material.dart';

class TemaCustom extends ThemeExtension<TemaCustom> {
  final Color? cor;
  final BoxDecoration? decoration;

  TemaCustom({required this.cor, required this.decoration});

  @override
  TemaCustom copyWith({Color? cor, BoxDecoration? decoration}) {
    return TemaCustom(
      cor: cor ?? this.cor,
      decoration: decoration ?? this.decoration,
    );
  }

  @override
  TemaCustom lerp(ThemeExtension<TemaCustom>? other, double t) {
    if (other is! TemaCustom) {
      return this;
    }
    return TemaCustom(
      cor: Color.lerp(cor, other.cor, t),
      decoration: BoxDecoration.lerp(decoration, other.decoration, t),
    );
  }
}
