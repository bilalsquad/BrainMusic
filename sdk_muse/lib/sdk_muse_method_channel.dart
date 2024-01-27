import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sdk_muse_platform_interface.dart';

/// An implementation of [SdkMusePlatform] that uses method channels.
class MethodChannelSdkMuse extends SdkMusePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sdk_muse');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
