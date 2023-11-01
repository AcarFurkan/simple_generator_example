import 'package:analyzer/dart/element/element.dart';
import 'package:annotation/annotation.dart';
import 'package:build/build.dart';
import 'package:generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class SimpleGenerator extends GeneratorForAnnotation<SimpleAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    bool addHello = annotation.read('addHello').boolValue;

    String className = visitor.className;
    Map<String, dynamic> fields = visitor.fields;

    final toJsonCode = _generateToJsonCode(className, fields);
    final fromJsonCode = _generateFromJsonCode(className, fields);
    final printHelloCode = addHello ? addHelloComment() : '';

    return '$toJsonCode\n\n$fromJsonCode\n\n$printHelloCode';
  }

  String _generateToJsonCode(String className, Map<String, dynamic> fields) {
    final fieldMapEntries =
        fields.keys.map((key) => " '$key': $key").join(',\n');

    return '''
      extension ${className}ToJson on $className {
        Map<String, dynamic> toJson() => {
          $fieldMapEntries
        };
      }
    ''';
  }

  String _generateFromJsonCode(String className, Map<String, dynamic> fields) {
    final fieldAssignments =
        fields.keys.map((key) => "$key: this['$key']").join(',\n');

    return '''
      extension ${className}FromJson on Map<String, dynamic> {
        $className to$className() => $className(
          $fieldAssignments
        );
      }
    ''';
  }

  String addHelloComment() {
    return '// Hello from SimpleGenerator';
  }
}
