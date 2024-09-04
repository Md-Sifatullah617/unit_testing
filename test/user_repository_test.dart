import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_testing/user_model.dart';
import 'package:unit_testing/user_repository.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    userRepository = UserRepository(mockHttpClient);
  });
  group("user repository -", () {
    group("get user function", () {
      test(
          "given user repository class when the get user function is called and the response code is equal to 200 and a user model should have been thrown",
          () async {
        //arrange
        when(() => mockHttpClient
                .get(Uri.parse("https://jsonplaceholder.org/users/1")))
            .thenAnswer((invocation) async {
          return Response('''
            {
  "id": 1,
  "firstname": "John",
  "lastname": "Doe",
  "email": "johndoe@example.com",
  "birthDate": "1973-01-22",
  "login": {
    "uuid": "1a0eed01-9430-4d68-901f-c0d4c1c3bf22",
    "username": "johndoe",
    "password": "jsonplaceholder.org",
    "md5": "c1328472c5794a25723600f71c1b4586",
    "sha1": "35544a31cc19bd6520af116554873167117f4d94",
    "registered": "2023-01-10T10:03:20.022Z"
  },
  "address": {
    "street": "123 Main Street",
    "suite": "Apt. 4",
    "city": "Anytown",
    "zipcode": "12345-6789",
    "geo": {
      "lat": "42.1234",
      "lng": "-71.2345"
    }
  },
  "phone": "(555) 555-1234",
  "website": "www.johndoe.com",
  "company": {
    "name": "ABC Company",
    "catchPhrase": "Innovative solutions for all your needs",
    "bs": "Marketing"
  }
}
            ''', 200);
        });
        //act
        final user = await userRepository.getUser();
        //assert
        expect(user, isA<User>());
      });

      test(
          "given user repository when the get user function is called and the status code isn't 200 then an exception should been thrown",
          () async {
        //arrange
        when(() => mockHttpClient
                .get(Uri.parse("https://jsonplaceholder.org/users/1")))
            .thenAnswer((invocation) async => Response('{}', 500));
        //act
        final user = userRepository.getUser();
        //assert
        expect(user, throwsException);
      });
    });
  });
}
