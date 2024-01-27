import 'package:flutter_test/flutter_test.dart';
import 'package:sdk_muse/sdk_muse.dart';
import 'package:sdk_muse/sdk_muse_platform_interface.dart';
import 'package:sdk_muse/sdk_muse_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSdkMusePlatform
    with MockPlatformInterfaceMixin
    implements SdkMusePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SdkMusePlatform initialPlatform = SdkMusePlatform.instance;

  test('$MethodChannelSdkMuse is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSdkMuse>());
  });

  test('getPlatformVersion', () async {
    SdkMuse sdkMusePlugin = SdkMuse();
    MockSdkMusePlatform fakePlatform = MockSdkMusePlatform();
    SdkMusePlatform.instance = fakePlatform;

    expect(await sdkMusePlugin.getPlatformVersion(), '42');
  });
}
