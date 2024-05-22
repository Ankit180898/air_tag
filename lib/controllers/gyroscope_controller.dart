import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeController extends GetxController {
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  RxDouble _rotationZ = 0.0.obs;
  double _distance = 0.0;
  final double _alpha = 0.1; // Low-pass filter coefficient
  double _lastAccelerationX = 0.0;
  double _lastAccelerationY = 0.0;
  double _lastAccelerationZ = 0.0;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  @override
  void onInit() {
    super.onInit();
    _gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      _updateGyroscopeData(event);
    });
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      _updateDistance(event);
    });
  }

  @override
  void onClose() {
    _gyroscopeSubscription?.cancel();
    _accelerometerSubscription?.cancel();
    super.onClose();
  }

  void _updateGyroscopeData(GyroscopeEvent event) {
    _rotationX = _alpha * -event.x + (1 - _alpha) * _rotationX;
    _rotationY = _alpha * -event.y + (1 - _alpha) * _rotationY;
    _rotationZ.value = _alpha * -event.z + (1 - _alpha) * _rotationZ.value;
    update();
  }

  void _updateDistance(AccelerometerEvent event) {
    double dx = event.x - _lastAccelerationX;
    double dy = event.y - _lastAccelerationY;
    double dz = event.z - _lastAccelerationZ;
    double acceleration = sqrt(dx * dx + dy * dy + dz * dz);
    double deltaTime = 0.1; // Assuming 10Hz frequency
    _distance += 0.5 * acceleration * deltaTime * deltaTime;
    _lastAccelerationX = event.x;
    _lastAccelerationY = event.y;
    _lastAccelerationZ = event.z;
    update();
  }

  double get rotationX => _rotationX;
  double get rotationY => _rotationY;
  double get rotationZ => _rotationZ.value;
  double get distance => _distance;

}
