import 'package:flutter/material.dart';
import '../pages/animated_map_controller.dart';
import '../pages/esri.dart';
import '../pages/home.dart';
import '../pages/map_controller.dart';
import '../pages/marker_anchor.dart';
import '../pages/offline_map.dart';
import '../pages/plugin_api.dart';
import '../pages/polyline.dart';
import '../pages/tap_to_add.dart';
import '../pages/on_tap.dart';

Drawer buildDrawer(BuildContext context, String currentRoute) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        const DrawerHeader(
          child: const Center(
            child: const Text("Flutter Map Examples"),
          ),
        ),
        ListTile(
          title: const Text('OpenStreetMap'),
          selected: currentRoute == HomePage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, HomePage.route);
          },
        ),
        ListTile(
          title: const Text('Add Pins'),
          selected: currentRoute == TapToAddPage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, TapToAddPage.route);
          },
        ),
        ListTile(
          title: const Text('Esri'),
          selected: currentRoute == EsriPage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, EsriPage.route);
          },
        ),
        ListTile(
          title: const Text('Polylines'),
          selected: currentRoute == PolylinePage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, PolylinePage.route);
          },
        ),
        ListTile(
          title: const Text('MapController'),
          selected: currentRoute == MapControllerPage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, MapControllerPage.route);
          },
        ),
        ListTile(
          title: const Text('Animated MapController'),
          selected: currentRoute == AnimatedMapControllerPage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, AnimatedMapControllerPage.route);
          },
        ),
        ListTile(
          title: const Text('Marker Anchors'),
          selected: currentRoute == MarkerAnchorPage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, MarkerAnchorPage.route);
          },
        ),
        ListTile(
          title: const Text('Plugins'),
          selected: currentRoute == PluginPage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, PluginPage.route);
          },
        ),
        ListTile(
          title: const Text('Offline Map'),
          selected: currentRoute == OfflineMapPage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, OfflineMapPage.route);
          },
        ),
        ListTile(
          title: const Text('OnTap'),
          selected: currentRoute == OnTapPage.route,
          onTap: () {
            Navigator.popAndPushNamed(context, OnTapPage.route);
          },
        ),
      ],
    ),
  );
}
