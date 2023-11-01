library generator;

import 'package:build/build.dart';
import 'package:generator/src/simple_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateSimpleGenClass(BuilderOptions options) => SharedPartBuilder(
      [SimpleGenerator()],
      'simple_generator',
    );
