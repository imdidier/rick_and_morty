import 'package:rick_and_morty/domain/datasources/location_datasource.dart';
import 'package:rick_and_morty/domain/entities/location.dart';

class LocationDatasourceImpl extends LocationDatasource {
  @override
  Future<LocationEntity> geLocationById(int id) {
    // TODO: implement geLocationById
    throw UnimplementedError();
  }

  @override
  Future<List<LocationEntity>> getLocationByDimension(String dimension) {
    // TODO: implement getLocationByDimension
    throw UnimplementedError();
  }

  @override
  Future<List<LocationEntity>> getLocations({int page = 1}) {
    // TODO: implement getLocations
    throw UnimplementedError();
  }

  @override
  Future<List<LocationEntity>> searchLocation(String query) {
    // TODO: implement searchLocation
    throw UnimplementedError();
  }
}
