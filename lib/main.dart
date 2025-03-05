import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/roqqu_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RoqquApp(),
    ),
  );
}
