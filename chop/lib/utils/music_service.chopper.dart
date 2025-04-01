// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MusicService extends MusicService {
  _$MusicService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MusicService;

  @override
  Future<Response<SongDataModel>> getMusicData(Map<String, dynamic> querymap) {
    final Uri $url = Uri.parse('music/subcategoryandtracks');
    final Map<String, dynamic> $params = querymap;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<SongDataModel, SongDataModel>($request);
  }

  @override
  Future<Response<LoginResponseModel>> login(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('appusers/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginResponseModel, LoginResponseModel>($request);
  }
}
