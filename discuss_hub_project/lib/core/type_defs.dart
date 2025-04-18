import 'package:fpdart/fpdart.dart';
import 'package:discuss_hub_project/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
