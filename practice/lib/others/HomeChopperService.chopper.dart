// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeChopperService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$HomeChopperService extends HomeChopperService {
  _$HomeChopperService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = HomeChopperService;

  @override
  Future<Response<dynamic>> getUsers(int page) {
    final Uri $url = Uri.parse('');
    final Map<String, dynamic> $params = <String, dynamic>{'page': page};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUsers(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
