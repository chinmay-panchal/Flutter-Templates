import 'package:chopper/chopper.dart';

// This is required for code generation
part 'user_service.chopper.dart';

@ChopperApi(baseUrl: "/users") // Only the endpoint (not full URL)
abstract class UserService extends ChopperService {

  static UserService create([ChopperClient? client]) => _$UserService(client);

  @GET()
  Future<Response> getUsers(@Query('page') int page);

  @POST()
  Future<Response> createUsers(@Body() Map<String, dynamic> body);

}
























// import 'package:chopper/chopper.dart';

// // This is necessary for code generation
// part 'user_service.chopper.dart';

// @ChopperApi() // Base URL for this service
// abstract class UserService extends ChopperService {
//    static UserService create([ChopperClient? client]) => _$UserService(client);
//   @GET(
//     path: 'user'
//   )
//   Future<Response> getUsers(@Query('page') int page);

//   @POST()
//   Future<Response> createUser(@Body() Map<String, dynamic> body); // POST request

//   // Factory method
 
// }
