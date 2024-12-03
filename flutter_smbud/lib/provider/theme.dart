import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brightnessProvider = StateProvider<Brightness>((ref) => Brightness.light);

final verdeProvider = StateProvider<Color>((ref) =>const Color(0xffa3ba0b));
final barColorProvider = StateProvider<Color>((ref) =>const Color(0xff0b84be));
final backgroundProvider = StateProvider<Color>((ref) =>const Color(0xFF92e2f7));
final detProvider = StateProvider<Color>((ref) =>const Color(0xffFFFFFF));

