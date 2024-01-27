
import 'sdk_muse_platform_interface.dart';

class SdkMuse {
  Future<String?> getPlatformVersion() {
    return SdkMusePlatform.instance.getPlatformVersion();
  }
}
