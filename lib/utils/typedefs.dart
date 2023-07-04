import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import 'failure.dart';

typedef StringCallback = void Function(String val);
typedef Uint8ListCallback = void Function(Uint8List? val);
typedef DoubleCallback = void Function(double? val);
typedef BoolCallback = void Function({bool value});

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureUnit = FutureEither<Unit>;

typedef StreamEither<T> = Stream<Either<Failure, T>>;
typedef StreamUnit = StreamEither<Unit>;
