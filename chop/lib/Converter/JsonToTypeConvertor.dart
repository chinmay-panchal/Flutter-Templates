import 'dart:convert';

import 'package:chopper/chopper.dart';

class GenericJsonConverter extends JsonConverter {
  final Map<Type, Function> typeFactories;

  const GenericJsonConverter({required this.typeFactories});

  BodyType decode<BodyType, Item>(Map<String, dynamic> response) {
    if (!typeFactories.containsKey(BodyType)) {
      return 'error' as BodyType;
    }

    return typeFactories[BodyType]!(response) as BodyType;
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
        body: decode<BodyType, InnerType>(json.decode(response.body)));
  }
}
