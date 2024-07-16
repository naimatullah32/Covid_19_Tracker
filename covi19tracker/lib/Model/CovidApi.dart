/// latest : {"confirmed":197146,"deaths":7905,"recovered":80840}

class CovidApi {
  CovidApi({
      Latest? latest,}){
    _latest = latest;
}

  CovidApi.fromJson(dynamic json) {
    _latest = json['latest'] != null ? Latest.fromJson(json['latest']) : null;
  }
  Latest? _latest;
CovidApi copyWith({  Latest? latest,
}) => CovidApi(  latest: latest ?? _latest,
);
  Latest? get latest => _latest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_latest != null) {
      map['latest'] = _latest?.toJson();
    }
    return map;
  }

}

/// confirmed : 197146
/// deaths : 7905
/// recovered : 80840

class Latest {
  Latest({
      num? confirmed, 
      num? deaths, 
      num? recovered,}){
    _confirmed = confirmed;
    _deaths = deaths;
    _recovered = recovered;
}

  Latest.fromJson(dynamic json) {
    _confirmed = json['confirmed'];
    _deaths = json['deaths'];
    _recovered = json['recovered'];
  }
  num? _confirmed;
  num? _deaths;
  num? _recovered;
Latest copyWith({  num? confirmed,
  num? deaths,
  num? recovered,
}) => Latest(  confirmed: confirmed ?? _confirmed,
  deaths: deaths ?? _deaths,
  recovered: recovered ?? _recovered,
);
  num? get confirmed => _confirmed;
  num? get deaths => _deaths;
  num? get recovered => _recovered;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['confirmed'] = _confirmed;
    map['deaths'] = _deaths;
    map['recovered'] = _recovered;
    return map;
  }

}