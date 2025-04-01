import 'package:chop/Converter/JsonToTypeConvertor.dart';
import 'package:chop/Models/loginResponseModel.dart';
import 'package:chop/Models/songDataModel.dart';
import 'package:chop/utils/music_service.dart';
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
      baseUrl: Uri.parse("https://theapophis.com/apophis/api/"),

      services: [
        MusicService.create(),
      ],

      converter: const GenericJsonConverter(typeFactories: {
        SongDataModel: SongDataModel.fromJson,
        LoginResponseModel: LoginResponseModel.fromJson,
        // Add more models here
      },),

      errorConverter: JsonConverter(),
    );
  }
}
