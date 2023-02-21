import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/mongodb.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/mongodb.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/mongodb.dart';
import 'package:xplorevjtiofficialapp/views/about_vjti_view.dart';
import 'package:xplorevjtiofficialapp/views/contact_us.dart';
import 'package:xplorevjtiofficialapp/views/dashboard_non_vjti.dart';
import 'package:xplorevjtiofficialapp/views/dashboard_view.dart';
import 'package:xplorevjtiofficialapp/views/delete_notes_and_pyq.dart';
import 'package:xplorevjtiofficialapp/views/download_or_open_locations_view.dart';
import 'package:xplorevjtiofficialapp/views/forgot_password_view_nonvjti.dart';
import 'package:xplorevjtiofficialapp/views/forgot_password_view_vjti.dart';
import 'package:xplorevjtiofficialapp/views/extracurriculars.dart';
import 'package:xplorevjtiofficialapp/views/how_to_get_vjti.dart';
import 'package:xplorevjtiofficialapp/views/insert_notes_and_pyq.dart';
import 'package:xplorevjtiofficialapp/views/login_view_non_vjti.dart';
import 'package:xplorevjtiofficialapp/views/login_view_vjti.dart';
import 'package:xplorevjtiofficialapp/views/map_VJTI.dart';
import 'package:xplorevjtiofficialapp/views/notes_and_pyq_view.dart';
import 'package:xplorevjtiofficialapp/views/participant_senior_advice_view.dart';
import 'package:xplorevjtiofficialapp/views/search_notes_and_pyq.dart';
import 'package:xplorevjtiofficialapp/views/seniors_advice_view.dart';
import 'package:xplorevjtiofficialapp/views/sign_up_non_vjti.dart';
import 'package:xplorevjtiofficialapp/views/sign_up_vjti.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_service.dart';
import 'package:xplorevjtiofficialapp/views/splash_screen.dart';
import 'package:xplorevjtiofficialapp/views/student_account.dart';
import 'package:xplorevjtiofficialapp/views/update_student_details_view.dart';
import 'package:xplorevjtiofficialapp/views/update_notes_and_pyq.dart';
import 'dart:developer' as devtools show log;
import 'package:xplorevjtiofficialapp/views/verify_email_view.dart';
import 'package:xplorevjtiofficialapp/views/side_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';


const AndroidNotificationChannel channel = AndroidNotificationChannel(
 'high_importance_channel',
 'High Importance Notifications',
 //'This channel is used for important notifications',
 importance: Importance.high,
 playSound: true,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
   FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
 await Firebase.initializeApp();
 print('A bg message just showed up: ${message.messageId}');
}


void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
 await flutterLocalNotificationsPlugin
     .resolvePlatformSpecificImplementation<
         AndroidFlutterLocalNotificationsPlugin>()
     ?.createNotificationChannel(channel);
 await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
   alert: true,
   badge: true,
   sound: true,
 );
 await MongoDatabase.connect();
 await MongoNotesAndPyqDatabase.connect();
 await MongoSeniorAdviceDatabase.connect();
 // await MongoSeniorAdviceDatabase.delete();
 runApp(MaterialApp(
   home: SplashScreen(),
   routes: {
     loginVJTIRoute: (context) => const LoginViewVJTI(),
     signUpVJTIRoute: (context) => const SignUpVJTI(),
     loginNonVJTIRoute: (context) => const LoginViewNonVJTI(),
     dashBoardRoute: (context) => const DashBoardView(),
     dashboardViewnonVJTIRoute: (context) => const DashboardView_nonVJTI(),
     verifyEmailRoute: (context) => const VerifyEmailView(),
     signUpNonVJTIRoute: (context) => const SignUpNonVJTI(),
     aboutVJTIRoute: (context) => const AboutVJTIView(),
     studentAccountRoute: (context) => const StudentVJTI(),
     howToGetVJTIRoute: (context) => const HowToGetVJTI(),
     forgotPasswordRoute: (context) => const ForgotPasswordVJTIView(),
     extracurricularsRoute: (context) => ExtraCurriculars(),
     contactUsRoute: (context) => const ContactUsView(),
     notesAndPyqRoute: (context) => const NotesAndPyqView(),
     insertNotesAndPyqRoute: (context) => const InsertNotesAndPyqView(),
     updateNotesAndPyqRoute: (context) => const UpdateNotesAndPyqView(),
     deleteNotesAndPyqRoute: (context) => const DeleteNotesAndPyqView(),
     seniorAdviceRoute: (context) => const SeniorAdviceView(),
     updateStudentDetailsRoute: (context) => const UpdateStudentDetails(),
     participantSeniorAdviceRoute: (context) =>
         const ParticipantSeniorAdviceView(),
     mapOfVJTIRoute: ((context) => const MapVJTI()),
     // searchNotesAndPyqRoute:(context) => const SearchNotesAndPyqView(),
     downloadOrOpenLocationsRoute: (context) => const LocationsView(),
     searchNotesAndPyqRoute: (context) => const SearchNotesAndPyqPreviewView(),
     forgotPasswordNonVjtiRoute: (context) => const ForgotPasswordNonVJTIView()
   },
 ));
}


class HomePage extends StatelessWidget {
 const HomePage({super.key});


 @override
 Widget build(BuildContext context) {
   /*
     FutureBuilder Widget is used to create widgets based on the latest snapshot of interaction with a Future
     It also helps us  to execute some Asynchronous code and based upon that UI will update.
     It has four states.
   */
   return FutureBuilder(
       future: AuthService.firebase().initalize(),
       builder: (context, snapshot) {
         switch (snapshot.connectionState) {
           case ConnectionState.done:
             // AuthService.firebase().logOut();
             final user = AuthService.firebase().currentUser;
             if (user != null) {
               if (user.isEmailVerified) {
                 devtools.log('User is Verified');
                 return const DashBoardView();
               } else {
                 AuthService.firebase().sendEmailVerification();
                 return const VerifyEmailView();
               }
             } else {
               return const LoginViewVJTI();
             }
           default:
             return const CircularProgressIndicator();
         }
       });
 }
}
