import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getXclass extends GetxController {
  static RxString ans = "".obs;
  static RxInt index1 = 0.obs;
  static SharedPreferences? srf;
  static RxList lavels = [].obs;
  static List finalans = [
    "10",
    "25",
    " 6",
    "14",
    "128",
    "7",
    "50",
    "1025",
    "100",
    "3",
    "212",
    "3011",
    "14",
    "16",
    "1",
    " 2",
    "44",
    "45",
    "625",
    "1",
    "13",
    "47",
    "50"
  ];
  static List hint = [
    "Sum,5+5=10",
    "multiplication",
    "multiply by the previous digit",
    "You have to count the number of squares",
    "Digit square multiplied by 2",
    "Difference between numbers is an increasing multiple of 5",
    "Apply BODMAS",
    "the first digit is the sum of two digits, the second digit is the multiplication of two digits",
    "(1+1)*(1+1)=4",
    "Each digit is the diagonal sum of the two numbers",
    "First digit is the subtraction of given numbers the second number is the addition on numbers",
    "the first digit is the multiplication of given numbers,the last digit is the addition of numbers.",
    "Apply Bodmas first, do division and multiplication then sum and subtraction",
    "Left most digit is Square of the division of bottom number",
    "each row sum is increased by 5",
    "difference of two number is increasing multiple of 5",
    "subtract the second digit from reverse of two digits"
        "63-36=27 similarly",
    "first box contains square of 1 2 3 4 5 the second box contains a cube of 1 2 3 4 5 similarly, the 3rd box contains 4th power of 1 2 3 4 5",
    "The sum two numbers give the next number in upper or lower line like",
    "Count the number of triangles",
    "A*B+(B-1)",
    "(A*B)+C"
  ];
  static RxInt skiptimer = 0.obs;

  Future<void> sharedprf() async {
    print("xyz==");
    srf = await SharedPreferences.getInstance();
    lavels_off();
    index1.value = srf!.getInt("lavel") ?? 0;


  }

  void lavels_off() {
    lavels.value = [];
    for (int i = 0; i <= 74; i++) {
      lavels.add(srf!.getString("$i") ?? "panding");
    }

  }

  @override
  void onInit() {
    // TODO: implement onInit

    sharedprf();
  }
}
