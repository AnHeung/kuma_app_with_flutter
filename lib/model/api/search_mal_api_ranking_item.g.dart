// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_mal_api_ranking_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRankingApiResult _$SearchRankingApiResultFromJson(
    Map<String, dynamic> json) {
  return SearchRankingApiResult(
    err: json['err'] as bool,
    msg: json['msg'] as String,
    result: (json['result'] as List)
        ?.map((e) => e == null
            ? null
            : SearchRankingApiItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchRankingApiResultToJson(
        SearchRankingApiResult instance) =>
    <String, dynamic>{
      'err': instance.err,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchRankingApiItem _$SearchRankingApiItemFromJson(Map<String, dynamic> json) {
  return SearchRankingApiItem(
    type: json['type'] as String,
    rank_result: (json['rank_result'] as List)
        ?.map((e) => e == null
            ? null
            : SearchRankingData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchRankingApiItemToJson(
        SearchRankingApiItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'rank_result': instance.rank_result,
    };

SearchRankingData _$SearchRankingDataFromJson(Map<String, dynamic> json) {
  return SearchRankingData(
    id: json['id'] as int,
    title: json['title'] as String,
    image: json['image'] as String,
    ranking: json['ranking'] as int,
  );
}

Map<String, dynamic> _$SearchRankingDataToJson(SearchRankingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'ranking': instance.ranking,
    };