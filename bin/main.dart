import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  const size = 10;
  const url = 'https://random-data-api.com/api/users/random_user?size=${size}';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);
      for (var user in users) {
        print(
            'UID: ${user['uid']}, Full name: ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Failed to load data');
    }
  } catch (err) {
    print('Error: $err');
  }
}
