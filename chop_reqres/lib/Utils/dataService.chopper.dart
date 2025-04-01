// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$DataService extends DataService {
  _$DataService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = DataService;

  @override
  Future<Response<UserDataModel>> getUserData() {
    final Uri $url = Uri.parse('users?page=2');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserDataModel, UserDataModel>($request);
  }
}
