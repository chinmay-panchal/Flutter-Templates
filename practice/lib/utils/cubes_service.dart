import 'package:chopper/chopper.dart';
import 'package:practice/models/cubesDataModel.dart';

part 'cubes_service.chopper.dart';

@ChopperApi()
abstract class CubesService extends ChopperService {
  static CubesService create([ChopperClient? client]) => _$CubesService(client);

  @GET(path: "/cubes")
  Future<Response<CubesDataModel>> getCubesData();
}