import 'package:chopper/chopper.dart';
import 'package:practice/convertor/jsonToTypeConvertor.dart';
import 'package:practice/models/cubesDataModel.dart';
import 'package:practice/utils/cubes_service.dart';

class ChopperClientInstance {
  static final ChopperClientInstance _singleton =
      ChopperClientInstance._internal();

  factory ChopperClientInstance() {
    return _singleton;
  }

  ChopperClientInstance._internal();

  static ChopperClient? client;

  static void initializeChopperClient() {
    client ??= ChopperClient(
      baseUrl: Uri.parse("https://fargo-api.datausa.io"),

      services: [
        CubesService.create(),
      ],

      converter: const GenericJsonConverter(typeFactories: {
        CubesDataModel: CubesDataModel.fromJson,
        // Add more models here
      },),

      errorConverter: JsonConverter(),
    );
  }
}
