import 'package:get/get.dart';

class HomeController extends GetxController {
  var name = ''.obs;
  var sentence = ''.obs;
  var isPalindrome = false.obs;

  void cekPalindrome() {
    String kata =
        sentence.value.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    isPalindrome.value = kata == kata.split('').reversed.join('');
  }
}
