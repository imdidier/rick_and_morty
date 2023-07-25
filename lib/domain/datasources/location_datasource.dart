import '../entities/entities.dart';

abstract class LocationDatasource {
  Future<List<LocationEntity>> getLocations({int page = 1});
  Future<LocationEntity> geLocationById(int id);
  Future<List<LocationEntity>> getLocationByDimension(String dimension);
  Future<List<LocationEntity>> searchLocation(String query);
}
