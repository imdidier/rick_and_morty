import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/ui/providers/location_provider.dart';

import '../../infrastructure/models/location.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late LocationProvider locationProvider;

  List<ResultLocation> locations = [];

  List<Widget> allItems = [];

  bool isfirstTime = true;

  @override
  void didChangeDependencies() async {
    locationProvider = context.watch<LocationProvider>();
    setup();
    _scrollController.addListener(() async {
      if ((_scrollController.position.pixels + 500 >=
          _scrollController.position.maxScrollExtent)) {
        await locationProvider.loadNextPage();
      }
    });
    super.didChangeDependencies();
  }

  setup() {
    if (isfirstTime) {
      locationProvider.getAllLocations();
      isfirstTime = false;
    }
    locations = locationProvider.listLocations;
    // List.generate(
    //   locations.length,
    //   (index) => allItems.add(ItemCharacter(resultCharacter: location[index])),
    // );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (allItems.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Locations'), centerTitle: true),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runSpacing: 5,
            spacing: 10,
            direction: Axis.horizontal,
            children: allItems,
          ),
        ),
      ),
    );
  }
}
