import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/domain/repositories/location_repository.dart';
import 'package:rick_and_morty/infrastructure/datasources/location_datasource_impl.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationDatasourceImpl locationDatasourceImpl;

  LocationRepositoryImpl(this.locationDatasourceImpl);

  @override
  Future<LocationEntity> geLocationById(int id) {
    return locationDatasourceImpl.geLocationById(id);
  }

  @override
  Future<List<LocationEntity>> getLocationByDimension(String dimension) {
    return locationDatasourceImpl.getLocationByDimension(dimension);
  }

  @override
  Future<List<LocationEntity>> getLocations({int page = 1}) {
    return locationDatasourceImpl.getLocations(page: page);
  }

  @override
  Future<List<LocationEntity>> searchLocation(String query) {
    return locationDatasourceImpl.searchLocation(query);
  }
}
