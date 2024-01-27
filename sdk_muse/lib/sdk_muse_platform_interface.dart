import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sdk_muse_method_channel.dart';

abstract class SdkMusePlatform extends PlatformInterface {
  /// Constructs a SdkMusePlatform.
  SdkMusePlatform() : super(token: _token);

  static final Object _token = Object();

  static SdkMusePlatform _instance = MethodChannelSdkMuse();

  /// The default instance of [SdkMusePlatform] to use.
  ///
  /// Defaults to [MethodChannelSdkMuse].
  static SdkMusePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SdkMusePlatform] when
  /// they register themselves.
  static set instance(SdkMusePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
