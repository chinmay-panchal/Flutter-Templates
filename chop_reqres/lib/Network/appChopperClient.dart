import 'package:chop_reqres/Convertor/jsonToTypeConvertor.dart';
import 'package:chop_reqres/Models/userDataModel.dart';
import 'package:chop_reqres/Utils/dataService.dart';
import 'package:chopper/chopper.dart';

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
      baseUrl: Uri.parse("https://reqres.in/api/"),

      services: [
        DataService.create(),
      ],

      converter: const GenericJsonConverter(typeFactories: {
        UserDataModel: UserDataModel.fromJson,
      },),

      errorConverter: JsonConverter(),
    );
  }
}