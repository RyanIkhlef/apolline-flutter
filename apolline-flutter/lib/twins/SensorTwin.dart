import 'package:apollineflutter/twins/SensorTwinEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

class SensorTwin {
  String _uuid;
  BluetoothCharacteristic _device;
  bool _isSendingData;
  bool _isSendingHistory;
  Map<SensorTwinEvent, SensorTwinEventCallback> _callbacks;


  SensorTwin({@required BluetoothCharacteristic device}) {
    this._device = device;
  }


  String get uuid {
    return this._device.uuid.toString();
  }


  /// Starts sending data live (one point every second) through Bluetooth
  /// connection.
  /// Does nothing if data transmission is already in progress.
  Future<void> launchDataLiveTransmission () {}

  /// Stops sending data.
  /// Does nothing if data transmission is not in progress.
  Future<void> stopDataLiveTransmission () {}


  /// Starts sending data stored on the SD card.
  /// Does nothing is history transmission is already in progress.
  Future<void> launchHistoryTransmission () {}


  /// Synchronises internal clock with phone's time.
  Future<void> synchronizeClock () {}


  /// Registers a function to be called when new data is produced.
  void on (SensorTwinEvent event, SensorTwinEventCallback callback) {}
}