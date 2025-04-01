import 'package:chop/Models/loginResponseModel.dart';
import 'package:chop/Models/songDataModel.dart';
import 'package:chopper/chopper.dart';

part 'music_service.chopper.dart';

@ChopperApi()
abstract class MusicService extends ChopperService {
  static MusicService create([ChopperClient? client]) => _$MusicService(client);

  @GET(path: "music/subcategoryandtracks")
  Future<Response<SongDataModel>> getMusicData(
      @QueryMap() Map<String, dynamic> querymap);

  @POST(path: "appusers/login")
  // Future<Response> login(@Body() Map<String, dynamic> body);
  Future<Response<LoginResponseModel>> login(@Body() Map<String, dynamic> body);
}

// flutter pub run build_runner build --delete-conflicting-outputs