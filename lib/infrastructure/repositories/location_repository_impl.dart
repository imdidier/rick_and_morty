import 'package:rick_and_morty/domain/repositories/location_repository.dart';
import 'package:rick_and_morty/infrastructure/datasources/location_datasource_impl.dart';

import '../models/location.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationDatasourceImpl locationDatasourceImpl;

  LocationRepositoryImpl(this.locationDatasourceImpl);

  @override
  Future<ResultLocation> getLocationById(int id) {
    return locationDatasourceImpl.getLocationById(id);
  }

  @override
  Future<List<ResultLocation>> getLocationByDimension(String dimension) {
    return locationDatasourceImpl.getLocationByDimension(dimension);
  }

  @override
  Future<List<ResultLocation>> getLocations({int page = 1}) {
    return locationDatasourceImpl.getLocations(page: page);
  }

  @override
  Future<List<ResultLocation>> searchLocation(String query) {
    return locationDatasourceImpl.searchLocation(query);
  }
  
  
}
