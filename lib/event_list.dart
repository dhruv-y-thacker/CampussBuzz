import 'dart:developer';

import 'package:campusbuzz/categories.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; //import 'package:campusbuzz_mainui/data/event_list.dart';

// Constants in Dart should be written in lowerCamelcase.
const AvailableCategories = [
  Categori(id: 'c1', Ctitle: 'Fests', color: Color.fromARGB(255, 255, 255, 255),categimg: 'images/festt.png'),
  Categori(id: 'c2', Ctitle: 'Sports', color: Color.fromARGB(83, 255, 255, 255),categimg: 'images/sportt.png'),
  Categori(id: 'c3', Ctitle: 'Cultural', color: Color.fromARGB(255, 255, 255, 255),categimg: 'images/festt.png'),
  Categori(id: 'c4', Ctitle: 'Tech', color: Color.fromARGB(92, 255, 255, 255),categimg: 'images/techh.png'),
  Categori(id: 'c5', Ctitle: 'Talks', color: Color.fromARGB(255, 255, 255, 255),categimg: 'images/sportt.png'),
];

//event details
List<Event> Event_details = [
  // Event(
  //     //type:'popular Events' ,
  //   id: 'm1',
  //   //type:["Near By Events","Popluar Events"],
  //   categories: "c1",
  //   date: 'Oct 18 2023',
  //   title: 'Aquila Fest 2023',
  //   imageUrl:
  //       'images/spec.png',
  //   time: '08:30 PM',
  //   college_name: "SPEC" ,
  //   about_event_title:'About Event' ,
  //   about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
  //   price: "300",
  // ),

  //   Event(
  //   id: 'm1',
  //   //type:["Near By Events","Popluar Events"],
  //     //type:'Nearby Events' ,
  //   categories: "c4",
  //   date: 'Aug 25 2023',
  //   title: 'Hacktopia',
  //   imageUrl: 'images/hacktopia.png',
  //   time: '10:00:00 AM',
  //   college_name: "GNITC",
  //   about_event_title: 'HACKTOPIA',
  //   about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,

  //   price: "300/person",
  // ),
  // Event(
  //   id: 'm2',
  //   //type: ["Popular Events"],
  //     //type: 'popular Events' ,
  //   categories: "c4",
  //   date: 'Sep 26 2023',
  //   title: 'Convergence',
  //   imageUrl: 'images/vnrvjiet.jpg',
  //   time: '9:00 AM',
  //   college_name: "VNRVJIET",
  //   about_event_title: 'CONVERGENCE 23',
  //   about_event_content: "Experience Innovation",
  //   // about_event_content:"here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum." ,
  //   price: "500/team",
  // ),
  // Event(
  //   id: 'm3',
  //   //type: ["Near By Events","Popular Events"],
  //     //type:'Nearby Events' ,
  //   categories: "c1",
  //   date: 'Oct 28 2023',
  //   title: 'Spandana',
  //   imageUrl: 'images/7.jpg',//index
  //   time: '05:00 PM',
  //   college_name: "IARE",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: "600/head",
  // ),
  // // Event(
  // //   id: 'm4',
  // //   // type: ["Near By Events","Popular Events"],
  // //   categories: "c1",
  // //   date: 'Sep 29 2023',
  // //   title: 'Aquilla',
  // //   imageUrl: 'images/dance.jpg',
  // //   time: '06:00 PM',
  // //   college_name: "SPEC",
  // //   about_event_title: 'About Event',
  // //   about_event_content:
  // //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  // //   price: '800/team',
  // // ),
  // Event(
  //   id: 'm5',
  //   //type: ["Near By Events","Popular Events"],
  //     //type:'popular Events' ,
  //   categories: "c2",
  //   date: 'Sep 13 2023',
  //   title: 'Sports Fest',
  //   imageUrl: 'images/malla.jpg',
  //   time: '10:00 AM',
  //   college_name: "MRUH",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: "900/team",
  // ),
  // Event(
  //   id: 'm6',
  //   //type: ["Popular Events"],
  //     //type:'Nearby Events' ,
  //   categories: "c2",
  //   date: 'Dec 23 2023',
  //   title: 'Borealis',
  //   imageUrl: 'images/bore.jpg',
  //   time: '11:00 AM ',
  //   college_name: "ATRI",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: "500/head",
  // ),
  // Event(
  //   id: 'm7',
  //   //type: ["Popular Events"],
  //     //type:'popular Events' ,
  //   categories: "c3",
  //   date: 'Dec 14 2023',
  //   title: 'Rishi Annual Cultural ',
  //   imageUrl: 'images/rishi.jpg',
  //   time: '10:00 AM',
  //   college_name: "RITW",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: '100/head',
  // ),
  // Event(
  //   id: 'm8',
  //   //type: ["Popular Events"],
  //     //type: 'Nearby Events',
  //   categories: "c3",
  //   date: 'Oct 05 2023',
  //   title: 'Dance Competition',
  //   imageUrl: 'images/dance.jpg',
  //   time: '11:00 AM ',
  //   college_name: "SPEC",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: "100/head",
  // ),
  // Event(
  //   id: 'm9',
  //   //type: ["Popular Events"],
  //     //type: 'popular Events',
  //   categories: "c6",
  //   date: 'Dec 28 2023',
  //   title: 'Cheriyal Painting',
  //   imageUrl: 'images/cheri.jpg',
  //   time: '09:00 AM',
  //   college_name: "SMEC",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: "200/head",
  // ),
  // Event(
  //   id: 'm10',
  //   //type: ["Popular Events"],
  //     //type:'popular Events' ,
  //   categories: "c6",
  //   date: 'Sep 14 2023',
  //   title: 'Sahtiya',
  //   imageUrl: 'images/sahitya.webp',
  //   time: '11:00 AM',
  //   college_name: "NAARM",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: "300",
  // ),
  // Event(
  //   id: 'm11',
  //   //type: ["Popular Events"],
  //     //type:'popular Events' ,
  //   categories: "c5",
  //   date: 'Aug 30 2023',
  //   title: 'Deign Thinking ',
  //   imageUrl: 'images/2.png',
  //   time: '10:00 AM',
  //   college_name: "CMRIT",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: "Free",
  // ),
  // Event(
  //   id: 'm12',
  //   //type: ["Popular Events"],
  //    // type:'popular Events' ,
  //   categories: "c5",
  //   date: 'Oct 05 2023',
  //   title: 'Chemfluence',
  //   imageUrl: 'images/5.jpg',
  //   time: '02:00 PM',
  //   college_name: "JNTUH",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: "Free",
  // ),
  // Event(
  //   id: 'm12',
  //   //type: ["Popular Events"],
  //   categories: "c5",
  //   date: 'Oct 05 2023',
  //   title: 'Chemfluence',
  //   imageUrl: 'images/5.jpg',
  //   time: '02:00 PM',
  //   college_name: "JNTUH",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: "Free",
  // ),
];

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

// Install cloud_firestore and import
//Add the below function gettingData() to event_list.dart

//Start of gettingData()

Future<List<Event>> gettingData() async {
  log("------------------------------------------------------------------------------------------------------------------------------");
  log("Retrieving Data....");
  try {
    final QuerySnapshot eventSnapshot =
        await FirebaseFirestore.instance.collection('Event').get();
    log('Number of documents retrieved: ${eventSnapshot.size}');

    // Map each document in the QuerySnapshot to an Event object.
    final List<Event> events = eventSnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      log('Document ID: ${doc.id}');
      return Event(
        id: "${data['id']}",
        // id: data['id'],
        college_name: data['college_name'],
        type: List<String>.from(data['type']),
        categories: data['categories'],
        date: data['date'],
        title: data['title'],
        imageUrl: data['imageUrl'],
        time: data['time'],
        about_event_title: data['about_event_title'],
        about_event_content: data['about_event_content'],
        price: data['price'],
        location: data['location'],
      );
    }).toList();

    Event_details = events;

    log("------------------------------------------------------------------------------------------------------------------------------");
    return events;
  } catch (error) {
    // Handle errors here, e.g., logging or displaying an error message.
    log('Error fetching events: $error');
    return [];
  }
}

//End of gettingData()
//Add documents in firestore with all all the parameters which list demands
// make sure the names are correct

// Eg:
// title: data['title'],
// The first title is the key of the list
// whereas second title in Squard brackets is database field(don't change)

//To add any event i have provided an sample event structure in the firestore ,
// refer it and create new one

//Since the images are displayed using paths
// in Databse in place of imageUrl field paste the required image path
//from the pubspec.yaml
