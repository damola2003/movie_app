class SeriesDetailsClass {
  bool? adult;
  String? backdropPath;
  List<CreatedBy>? createdBy;
  List<Null>? episodeRunTime;
  String? firstAirDate;
  List<Genres>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  NextEpisodeToAir? nextEpisodeToAir;
  List<Networks>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  // List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  List<Seasons>? seasons;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;

  SeriesDetailsClass(
      {this.adult,
      this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      // this.productionCompanies,
      this.productionCountries,
      this.seasons,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.voteCount});

  SeriesDetailsClass.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      createdBy = <CreatedBy>[];
      json['created_by'].forEach((v) {
        createdBy!.add(new CreatedBy.fromJson(v));
      });
    }
    // if (json['episode_run_time'] != null) {
    //   episodeRunTime = <Null>[];
    //   json['episode_run_time'].forEach((v) {
    //     episodeRunTime!.add(new Null.fromJson(v));
    //   });
    // }
    firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    inProduction = json['in_production'];
    languages = json['languages'].cast<String>();
    lastAirDate = json['last_air_date'];
    lastEpisodeToAir = json['last_episode_to_air'] != null
        ? new LastEpisodeToAir.fromJson(json['last_episode_to_air'])
        : null;
    name = json['name'];
    nextEpisodeToAir = json['next_episode_to_air'] != null
        ? new NextEpisodeToAir.fromJson(json['next_episode_to_air'])
        : null;
    if (json['networks'] != null) {
      networks = <Networks>[];
      json['networks'].forEach((v) {
        networks!.add(new Networks.fromJson(v));
      });
    }
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    // if (json['production_companies'] != null) {
    //   productionCompanies = <ProductionCompanies>[];
    //   json['production_companies'].forEach((v) {
    //     productionCompanies!.add(new ProductionCompanies.fromJson(v));
    //   });
    // }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(new ProductionCountries.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(new Seasons.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(new SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.map((v) => v.toJson()).toList();
    }
    // if (this.episodeRunTime != null) {
    //   data['episode_run_time'] =
    //       this.episodeRunTime!.map((v) => v.toJson()).toList();
    // }
    data['first_air_date'] = this.firstAirDate;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['in_production'] = this.inProduction;
    data['languages'] = this.languages;
    data['last_air_date'] = this.lastAirDate;
    if (this.lastEpisodeToAir != null) {
      data['last_episode_to_air'] = this.lastEpisodeToAir!.toJson();
    }
    data['name'] = this.name;
    if (this.nextEpisodeToAir != null) {
      data['next_episode_to_air'] = this.nextEpisodeToAir!.toJson();
    }
    if (this.networks != null) {
      data['networks'] = this.networks!.map((v) => v.toJson()).toList();
    }
    data['number_of_episodes'] = this.numberOfEpisodes;
    data['number_of_seasons'] = this.numberOfSeasons;
    data['origin_country'] = this.originCountry;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    // if (this.productionCompanies != null) {
    //   data['production_companies'] =
    //       this.productionCompanies!.map((v) => v.toJson()).toList();
    // }
    if (this.productionCountries != null) {
      data['production_countries'] =
          this.productionCountries!.map((v) => v.toJson()).toList();
    }
    if (this.seasons != null) {
      data['seasons'] = this.seasons!.map((v) => v.toJson()).toList();
    }
    if (this.spokenLanguages != null) {
      data['spoken_languages'] =
          this.spokenLanguages!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['type'] = this.type;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class CreatedBy {
  int? id;
  String? creditId;
  String? name;
  String? originalName;
  int? gender;
  String? profilePath;

  CreatedBy(
      {this.id,
      this.creditId,
      this.name,
      this.originalName,
      this.gender,
      this.profilePath});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creditId = json['credit_id'];
    name = json['name'];
    originalName = json['original_name'];
    gender = json['gender'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['credit_id'] = this.creditId;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['gender'] = this.gender;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class LastEpisodeToAir {
  int? id;
  String? name;
  String? overview;
  double? voteAverage;
  int? voteCount;
  String? airDate;
  int? episodeNumber;
  String? episodeType;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;

  LastEpisodeToAir(
      {this.id,
      this.name,
      this.overview,
      this.voteAverage,
      this.voteCount,
      this.airDate,
      this.episodeNumber,
      this.episodeType,
      this.productionCode,
      this.runtime,
      this.seasonNumber,
      this.showId,
      this.stillPath});

  LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    episodeType = json['episode_type'];
    productionCode = json['production_code'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = json['still_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['air_date'] = this.airDate;
    data['episode_number'] = this.episodeNumber;
    data['episode_type'] = this.episodeType;
    data['production_code'] = this.productionCode;
    data['runtime'] = this.runtime;
    data['season_number'] = this.seasonNumber;
    data['show_id'] = this.showId;
    data['still_path'] = this.stillPath;
    return data;
  }
}

class NextEpisodeToAir {
  int? id;
  String? name;
  String? overview;
  int? voteAverage;
  int? voteCount;
  String? airDate;
  int? episodeNumber;
  String? episodeType;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;

  NextEpisodeToAir(
      {this.id,
      this.name,
      this.overview,
      this.voteAverage,
      this.voteCount,
      this.airDate,
      this.episodeNumber,
      this.episodeType,
      this.productionCode,
      this.runtime,
      this.seasonNumber,
      this.showId,
      this.stillPath});

  NextEpisodeToAir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    episodeType = json['episode_type'];
    productionCode = json['production_code'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = json['still_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['air_date'] = this.airDate;
    data['episode_number'] = this.episodeNumber;
    data['episode_type'] = this.episodeType;
    data['production_code'] = this.productionCode;
    data['runtime'] = this.runtime;
    data['season_number'] = this.seasonNumber;
    data['show_id'] = this.showId;
    data['still_path'] = this.stillPath;
    return data;
  }
}

class Networks {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Networks({this.id, this.logoPath, this.name, this.originCountry});

  Networks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class Seasons {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;
  double? voteAverage;

  Seasons(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber,
      this.voteAverage});

  Seasons.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['episode_count'] = this.episodeCount;
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['season_number'] = this.seasonNumber;
    data['vote_average'] = this.voteAverage;
    return data;
  }
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['english_name'] = this.englishName;
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}
