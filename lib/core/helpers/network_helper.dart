import 'package:get_ip_address/get_ip_address.dart';

class NetworkHelper {
  static Future<String?> getIpAddress() async {
    try {
      var ipAddress = IpAddress(type: RequestType.json);
      var data = await ipAddress.getIpAddress();
      return data['ip'];
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
