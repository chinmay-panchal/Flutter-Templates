import 'package:chop_reqres/Models/userDataModel.dart';
import 'package:chopper/chopper.dart';

part 'dataService.chopper.dart';

@ChopperApi()
abstract class DataService extends ChopperService {
  static DataService create([ChopperClient? client]) => _$DataService(client);

  @GET(path: "users?page=2")
  Future<Response<UserDataModel>> getUserData();
  
  // Future<Response<UserDataModel>> getUserData(
  //     @QueryMap() Map<String, dynamic> querymap);

  // @POST(path: "appusers/login")
  // // Future<Response> login(@Body() Map<String, dynamic> body);

  // Future<Response<LoginResponseModel>> login(@Body() Map<String, dynamic> body);
}

// flutter pub run build_runner build --delete-conflicting-outputs