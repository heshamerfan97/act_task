import 'package:act_task/modules/main/views/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';



/// this class contains all routes names
class AppRouter {
 static Route<dynamic> generateRoute(RouteSettings settings) {

   PageRouteBuilder  pageRouteBuilder(Widget page) {

     return PageRouteBuilder(
         settings: settings,
         pageBuilder: (_, __, ___) => page,
         transitionsBuilder: (_, a, __, c) =>
             FadeTransition(opacity: a,child: c,)
     );
   }
     switch (settings.name){
       default:
            return pageRouteBuilder(const MainScreen());
     }
   }
  }




class Routes {
}
