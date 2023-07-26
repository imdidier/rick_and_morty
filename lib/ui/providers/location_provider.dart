import 'package:flutter/widgets.dart';

import '../../infrastructure/datasources/location_datasource_impl.dart';
import '../../infrastructure/models/location.dart';
import '../../infrastructure/repositories/location_repository_impl.dart';

class LocationProvider extends ChangeNotifier {
  int currentPage = 1;
  bool isLoading = false;
  List<ResultLocation> listLocations = [];
  late ResultLocation currentResultLocation;
  final repository = LocationRepositoryImpl(LocationDatasourceImpl());
  Future<List<ResultLocation>> getAllLocations() async {
    listLocations = await repository.getLocations(page: 1);
    notifyListeners();
    return listLocations;
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    List<ResultLocation> locations =
        await repository.getLocations(page: currentPage);
    listLocations = [...locations];
    await Future.delayed(const Duration(milliseconds: 100));
    isLoading = false;
    notifyListeners();
  }

  getLocationById(int locationId) async {
    currentResultLocation = await repository.getLocationById(locationId);
    notifyListeners();
  }
}
