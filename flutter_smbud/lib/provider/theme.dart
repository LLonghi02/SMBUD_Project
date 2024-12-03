import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brightnessProvider = StateProvider<Brightness>((ref) => Brightness.light);

final barColorProvider = StateProvider<Color>((ref) =>const Color(0xffd0b596));
final backgroundProvider = StateProvider<Color>((ref) =>const Color(0xFFa4bfa7));
final detProvider = StateProvider<Color>((ref) =>const Color(0xffFFFFFF));

final verdeProvider = StateProvider<Color>((ref) =>const Color(0xff193526));
final vcProvider= StateProvider<Color>((ref) =>const Color(0xffc0cfb2));