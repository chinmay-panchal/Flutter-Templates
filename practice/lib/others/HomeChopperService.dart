import 'package:chopper/chopper.dart';

// This is required for code generation
part 'HomeChopperService.chopper.dart';

@ChopperApi() // Only the endpoint (not full URL)
abstract class HomeChopperService extends ChopperService {

  static HomeChopperService create([ChopperClient? client]) => _$HomeChopperService(client);

  @GET()
  Future<Response> getUsers(@Query('page') int page);

  @POST()
  Future<Response> createUsers(@Body() Map<String, dynamic> body);

}

