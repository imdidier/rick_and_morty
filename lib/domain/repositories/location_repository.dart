import '../../infrastructure/models/location.dart';

abstract class LocationRepository {
  Future<List<ResultLocation>> getLocations({int page = 1});
  Future<ResultLocation> getLocationById(int id);
  Future<List<ResultLocation>> getLocationByDimension(String dimension);
  Future<List<ResultLocation>> searchLocation(String query);
}
