class SongDataModel {
  int? status;
  String? message;
  String? flowactivoplaylistName;
  String? flowactivoplaylistImage;
  List<ImageAssets>? imageAssets;
  List<Null>? mostPlayed;
  List<Data>? data;
  String? perPage;
  int? currentPage;
  int? lastPage;

  SongDataModel(
      {this.status,
      this.message,
      this.flowactivoplaylistName,
      this.flowactivoplaylistImage,
      this.imageAssets,
      this.mostPlayed,
      this.data,
      this.perPage,
      this.currentPage,
      this.lastPage});

  SongDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    flowactivoplaylistName = json['flowactivoplaylist_name'];
    flowactivoplaylistImage = json['flowactivoplaylist_image'];
    if (json['image_assets'] != null) {
      imageAssets = <ImageAssets>[];
      json['image_assets'].forEach((v) {
        imageAssets!.add(new ImageAssets.fromJson(v));
      });
    }
    if (json['most_played'] != null) {
      mostPlayed = <Null>[];
      json['most_played'].forEach((v) {
        // mostPlayed!.add(new Null.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['flowactivoplaylist_name'] = this.flowactivoplaylistName;
    data['flowactivoplaylist_image'] = this.flowactivoplaylistImage;
    if (this.imageAssets != null) {
      data['image_assets'] = this.imageAssets!.map((v) => v.toJson()).toList();
    }
    if (this.mostPlayed != null) {
      // data['most_played'] = this.mostPlayed!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    return data;
  }
}

class ImageAssets {
  String? displayType;
  String? imageType;
  ImageSize? imageSize;

  ImageAssets({this.displayType, this.imageType, this.imageSize});

  ImageAssets.fromJson(Map<String, dynamic> json) {
    displayType = json['display_type'];
    imageType = json['image_type'];
    imageSize = json['image_size'] != null
        ? new ImageSize.fromJson(json['image_size'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_type'] = this.displayType;
    data['image_type'] = this.imageType;
    if (this.imageSize != null) {
      data['image_size'] = this.imageSize!.toJson();
    }
    return data;
  }
}

class ImageSize {
  String? height;
  String? width;

  ImageSize({this.height, this.width});

  ImageSize.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    return data;
  }
}

class Data {
  int? flowactivoplaylistId;
  int? songId;
  String? songImage;
  String? originalImage;
  String? songName;
  String? songArtist;
  String? song;
  String? songDuration;
  int? favouritesCount;
  bool? favouritesStatus;
  int? totalPlayed;
  int? totalDownloads;
  int? playlistCount;
  bool? playlistStatus;

  Data(
      {this.flowactivoplaylistId,
      this.songId,
      this.songImage,
      this.originalImage,
      this.songName,
      this.songArtist,
      this.song,
      this.songDuration,
      this.favouritesCount,
      this.favouritesStatus,
      this.totalPlayed,
      this.totalDownloads,
      this.playlistCount,
      this.playlistStatus});

  Data.fromJson(Map<String, dynamic> json) {
    flowactivoplaylistId = json['flowactivoplaylist_id'];
    songId = json['song_id'];
    songImage = json['song_image'];
    originalImage = json['original_image'];
    songName = json['song_name'];
    songArtist = json['song_artist'];
    song = json['song'];
    songDuration = json['song_duration'];
    favouritesCount = json['favourites_count'];
    favouritesStatus = json['favourites_status'];
    totalPlayed = json['total_played'];
    totalDownloads = json['total_downloads'];
    playlistCount = json['playlist_count'];
    playlistStatus = json['playlist_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flowactivoplaylist_id'] = this.flowactivoplaylistId;
    data['song_id'] = this.songId;
    data['song_image'] = this.songImage;
    data['original_image'] = this.originalImage;
    data['song_name'] = this.songName;
    data['song_artist'] = this.songArtist;
    data['song'] = this.song;
    data['song_duration'] = this.songDuration;
    data['favourites_count'] = this.favouritesCount;
    data['favourites_status'] = this.favouritesStatus;
    data['total_played'] = this.totalPlayed;
    data['total_downloads'] = this.totalDownloads;
    data['playlist_count'] = this.playlistCount;
    data['playlist_status'] = this.playlistStatus;
    return data;
  }
}
