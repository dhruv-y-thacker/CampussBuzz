import 'package:campusbuzz/categories.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:flutter/material.dart';//import 'package:campusbuzz_mainui/data/event_list.dart';
import 'package:campusbuzz/categories.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:developer';


// Constants in Dart should be written in lowerCamelcase.
const AvailableCategories = [
  Categori(
    id: 'c1',
    Ctitle: 'Fests',
    color:Color(0xffE93030)

  ),

  Categori(
    id: 'c2',
    Ctitle: 'Sports',
    color:Color.fromARGB(255, 233, 48, 48)

  ),
  Categori(
    id: 'c3',
    Ctitle: 'Cultural',
    color:Color(0xffE93030)

  ),
  Categori(
    id: 'c4',
    Ctitle: 'Tech',
    color:Color(0xffE93030)

  ),
  Categori(
    id: 'c5',
    Ctitle: 'Talks',
    color:Color(0xffE93030)

  ),
];




  //event details
List<Event> Event_details = [
  Event(
    id: 'm1',
    type:["Near By Events","Popluar Events"],
    categories: "c1",
    date: 'Oct 18 2023',
    title: 'Aquila Fest 2023',
    imageUrl:
        'images/event.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),

  Event(
    id: 'm2',
    type: ["Popular Events"],
    categories: "c1",
    date: 'Oct 20 2023',
    title: 'Aquila Fest 2024',
    imageUrl:
        'images/music.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),

  Event(
    id: 'm2',
    type: ["Near By Events","Popular Events"],
    categories:"c2",
    date: 'Oct 20 2023',
    title: 'Aquila Fest 2024',
    imageUrl:
        'images/dance.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),

  Event(
    id: 'm2',
    type: ["Near By Events","Popular Events"],
    categories:"c2",
    date: 'Oct 20 2023',
    title: 'dance Fest 2024',
    imageUrl:
        'images/dance.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),

  Event(
    id: 'm2',
    type: ["Near By Events","Popular Events"],
    categories:"c2",
    date: 'Oct 20 2023',
    title: 'hiphop Fest 2024',
    imageUrl:
        'images/dance.jpg',
    time: '08:30 PM',
    college_name: "St. peter's engineering college" ,
    about_event_title:'About Event' ,
    about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
    price: 300,
  ),
  

    
];

// Future<List<Event>> fetchEventData() async {
//     // log("inside");
//     final DatabaseReference ref = FirebaseDatabase.instance
//         .ref("1tU0BkryAcRBG0GMo4QWvtAH5tnO2u-OHwXY4iCl_A6U")
//         .child('All Events');
//     // official id:1NiWJh6N_2MI9V-zhZIkr-3B_2zTkT105ATYsi0SZKlw
//     List<Event> eventList = [];

//     try {
//       // log("Started Fetching.....");
//       DatabaseEvent event = await ref.once();
//       DataSnapshot snapshot = event.snapshot;
//       if (snapshot.value != null && snapshot.value is Map<dynamic, dynamic>) {
//         final eventData = snapshot.value as Map<dynamic, dynamic>;

//         eventData.forEach((eventId, event) {
//           if (event is Map<dynamic, dynamic>) {
//             // log("Creaing the List......");
//             event['Event Id'] = eventId;
//             eventList.add(
              
//               Event(
//               id: eventId,
//               categories: event['categories'] ?? '',
//               date: event['date'] ?? '',
//               title: event['title'] ?? '',
//               imageUrl: event['imageUrl'] ?? '',
//               time: event['time'] ?? '',
//               college_name: event['collegeName'] ?? '',
//               about_event_title: event['aboutEventTitle'] ?? '',
//               about_event_content: event['aboutEventContent'] ?? '',
//               price: event['price'] ?? 0,
//             ));
//           }
//         });
//       } else {
//         log("No data available");
//       }
//     } catch (error) {
//       log("Error retrieving data: $error");
//     }
//     return eventList;
//   }



//   void printEventDetailsList(List<Event> eventList) {
//     for (int i = 0; i < eventList.length; i++) {
//       Event event = eventList[i];
//       log("Event $i:");
//       log("ID: ${event.id}");
//       log("Categories: ${event.categories}");
//       log("Date: ${event.date}");
//       log("Title: ${event.title}");
//       log("Image URL: ${event.imageUrl}");
//       log("Time: ${event.time}");
//       log("College Name: ${event.college_name}");
//       log("About Event Title: ${event.about_event_title}");
//       log("About Event Content: ${event.about_event_content}");
//       log("Price: ${event.price}");
//     }
//   }








// void main() async {
//   // Fetch event data from Firebase and add it to the 'event' list
//   List<Event> fetchedEvents = await fetchEventData();
//   Event_details.addAll(fetchedEvents);
//   printEventDetailsList(Event_details);

//   // Run the app
//   runApp(MyApp());
// }

// // ... Your 'fetchEventData' function remains the same

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // ... Your app configuration
//     return Container();
//   }
// }
