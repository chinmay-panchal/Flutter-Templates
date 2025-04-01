import 'package:chopper/chopper.dart';
import 'user_service.dart';

class ApiClient {
  static final ChopperClient client = ChopperClient(
    baseUrl: Uri.parse("https://reqres.in/api"), // Base URL for all API calls
    services: [
      UserService.create(),
    ],
    converter: JsonConverter(), // Auto-converts JSON
  );

  static UserService get userService => client.getService<UserService>();
}