import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:unique_identifier/unique_identifier.dart';


class DeviceInfoService {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Future<String> getUniqueId() async {
    String? serial = await UniqueIdentifier.serial;
    if (serial == null) {
      if (Platform.isIOS) {
        serial = (await deviceInfoPlugin.iosInfo).identifierForVendor;
      } else if(Platform.isAndroid) {
        serial = (await deviceInfoPlugin.androidInfo).serialNumber;
      }
    }
    return serial ?? '';
  }
}
