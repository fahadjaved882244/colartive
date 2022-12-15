import 'dart:io';

import 'package:colartive2/modules/components/popups/custom_snackbar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  late Map<String, dynamic> deviceData;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading(value);

  @override
  onInit() {
    super.onInit();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    isLoading = true;
    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      showCustomSnackBar("Error! Failed to get platform version.");
      deviceData = {'Error:': 'Failed to get platform version.'};
    } finally {
      isLoading = false;
    }
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'name': "${build.device} ",
      'brand': build.brand,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
    };
  }
}
