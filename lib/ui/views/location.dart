import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (locations.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final styleText = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(title: const Text('Locations'), centerTitle: true),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          ResultLocation location = locations[index];
          return FadeInRightBig(
            child: ListTile(
              autofocus: true,
              enableFeedback: true,
              onTap: () async {
                await locationProvider.getLocationById(location.id);
                // ignore: use_build_context_synchronously
                context.go('/home/0/locations/${location.id}');
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              // leading: _Image(character: location),
              title: Text(
                location.name,
                style: styleText,
              ),
              // subtitle: _ItemStatus(character: character),
            ),
          );
        },
      ),
    );
  }
}
