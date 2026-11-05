import 'package:get/get.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// All dependencies go here: useful for class quick-autoload
    Get.put(NetworkManager());
  }
}
