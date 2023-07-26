import 'package:dio/dio.dart';
import 'package:rick_and_morty/domain/datasources/location_datasource.dart';

import '../models/location.dart';

class LocationDatasourceImpl extends LocationDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
    ),
  );

  List<ResultLocation> _jsonToCharacter(Map<String, dynamic> json) {
    final LocationModel characterresp = LocationModel.fromJson(json);
    final List<ResultLocation> locations = characterresp.results.toList();
    return locations;
  }

  @override
  Future<ResultLocation> getLocationById(int id) async {
    final response = await dio.get(
      'location/$id',
    );
    ResultLocation locationResp = ResultLocation.fromJson(response.data);
    return locationResp;
  }

  @override
  Future<List<ResultLocation>> getLocationByDimension(String dimension) {
    // TODO: implement getLocationByDimension
    throw UnimplementedError();
  }

  @override
  Future<List<ResultLocation>> getLocations({int page = 1}) async {
    final response = await dio.get(
      'location?page=$page',
    );
    return _jsonToCharacter(response.data);
  }

  @override
  Future<List<ResultLocation>> searchLocation(String query) {
    // TODO: implement searchLocation
    throw UnimplementedError();
  }
}
