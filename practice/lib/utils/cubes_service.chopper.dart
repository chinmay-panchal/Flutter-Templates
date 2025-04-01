// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cubes_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CubesService extends CubesService {
  _$CubesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CubesService;

  @override
  Future<Response<CubesDataModel>> getCubesData() {
    final Uri $url = Uri.parse('/cubes');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CubesDataModel, CubesDataModel>($request);
  }
}
