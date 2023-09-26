// import 'dart:html';

// import 'dart:math';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
  
// class NotificationServices{
//   FirebaseMessaging messaging = FirebaseMessaging.instance ;

//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin  = FlutterLocalNotificationsPlugin();


//     //function to initialise flutter local notification plugin to show notifications for android when app is active
//   void initLocalNotifications(BuildContext context, RemoteMessage message)async{
//     var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iosInitializationSettings = const DarwinInitializationSettings();

//     var initializationSetting = InitializationSettings(
//         android: androidInitializationSettings ,
//         iOS: iosInitializationSettings
//     );

//     await _flutterLocalNotificationsPlugin.initialize(
//         initializationSetting,
//       onDidReceiveNotificationResponse: (payload){
//           // handle interaction when app is active for android
//           //handleMessage(context, message);
//       }
//     );
//   }


//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true,
//         sound: true ,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('user granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//         print('user granted provisional permission');
//     } else {
//       //appsetting.AppSettings.openNotificationSettings();
//       print('user denied permission');
//     }
//   }


//   void firebaseInit(){
//     FirebaseMessaging.onMessage.listen((message){
//       print(message.notification!.title.toString());
//       print(message.notification!.body.toString());
//       showNotification(message);
//     });
//   }

//   // function to show visible notification when app is active
//   Future<void> showNotification(RemoteMessage message)async{

//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//       Random.secure().nextInt(10000).toString(), 
//       'High Importance Notification',
//       importance: Importance.max,);
    
//     AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       channel.id.toString(),
//       channel.name.toString() ,
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//       priority: Priority.high ,
//       playSound: true,
//       ticker: 'ticker',
//          //sound: channel.sound
//     //     sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
//     //  icon: largeIconPath
//     );

//     const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
//       presentAlert: true ,
//       presentBadge: true ,
//       presentSound: true
//     ) ;

//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinNotificationDetails
//     );

//     Future.delayed(Duration.zero , (){
//       _flutterLocalNotificationsPlugin.show(
//           0,
//           message.notification!.title.toString(),
//           message.notification!.body.toString(),
//           notificationDetails,
//       );
//     });

//   }


//   //function to get device token on which we will send the notifications
//   Future<String> getDeviceToken() async {
//     String? token = await messaging.getToken();
//     return token!;
//   }

//   void isTokenRefresh()async{
//     messaging.onTokenRefresh.listen((event) {
//       event.toString();
//         print('refresh');
//     });
//   }
// }