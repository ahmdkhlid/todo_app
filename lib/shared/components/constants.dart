//https://newsapi.org/everything?q=tesla&apiKey=da745ac90cbc4106a8fa6fe501087179
//@dart=2.9

//
// void signOut(context) {
//   CacheHelper.removeData(key: 'token').then((value) {
//     if (value) {
//       navigateAndFinish(
//         context,
//         ShopLoginScreen(),
//       );
//     }
//   });
// }

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach(
        (match) => print(
          match.group(0),
        ),
      );
}

String token = '';
