import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/src/core/point.dart';
import 'package:flutter_map/src/gestures/gestures.dart';
import 'package:flutter_map/src/map/map.dart';

class FlutterMapState extends MapGestureMixin {
  final MapControllerImpl mapController;
  MapOptions get options => widget.options ?? MapOptions();
  MapState mapState;

  FlutterMapState(this.mapController);

  initState() {
    super.initState();
    mapState = MapState(options);
    mapController.state = mapState;
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      mapState.size =
          Point<double>(constraints.maxWidth, constraints.maxHeight);
      var layerWidgets = widget.layers
          .map((layer) => _createLayer(layer, widget.options.plugins))
          .toList();
      return GestureDetector(
        onScaleStart: handleScaleStart,
        onScaleUpdate: handleScaleUpdate,
        onScaleEnd: handleScaleEnd,
        onTapUp: handleTapUp,
        onDoubleTap: handleDoubleTap,
        child: Container(
          child: Stack(
            children: layerWidgets,
          ),
        ),
      );
    });
  }

  Widget _createLayer(LayerOptions options, List<MapPlugin> plugins) {
    if (options is TileLayerOptions) {
      return TileLayer(options: options, mapState: mapState);
    }
    if (options is MarkerLayerOptions) {
      return MarkerLayer(options, mapState);
    }
    if (options is PolylineLayerOptions) {
      return PolylineLayer(options, mapState);
    }
    for (var plugin in plugins) {
      if (plugin.supportsLayer(options)) {
        return plugin.createLayer(options, mapState);
      }
    }
    return null;
  }
}
