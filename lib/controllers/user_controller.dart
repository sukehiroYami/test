import 'package:get/get.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var selectedUserName = ''.obs;
  var page = 1.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    isLoading.value = true;
    var fetchedUsers = await ApiService.fetchUsers(page.value);
    users.addAll(fetchedUsers);
    isLoading.value = false;
  }

  void selectUser(User user) {
    selectedUserName.value = '${user.firstName} ${user.lastName}';
  }

  void loadMoreUsers() {
    page.value++;
    fetchUsers();
  }
}
