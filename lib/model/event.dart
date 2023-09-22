class Event {

  const Event({
    required this.id,
     required this.type,
    required this.categories,
    required this.date,
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.college_name,
    required this.about_event_title,
    required this.about_event_content,
    required this.price,
  });

  final String id;
  final List<String> type;
  final String categories;
  final String date;
  final String title;
  final String imageUrl;
  final String time;
  final String college_name;
  final String about_event_title;
  final String about_event_content;
  final String price;
}

class EventData {
  //static final faker = Faker();
  static final List<Event> Event_details = [
    // const Event(
    //   id: 'm1',
      
    //   categories: "c1",
    //   date: 'Oct 18 2023',
    //   title: 'Aquila Fest 2023',
    //   imageUrl: 'images/event.jpg',
    //   time: '08:30 PM',
    //   college_name: "St. peter's engineering college",
    //   about_event_title: 'About Event',
    //   about_event_content:
    //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
    //   price: "300",
    // ),
    // const Event(
    //   id: 'm2',
    //   categories: "c2",
    //   date: 'Oct 20 2023',
    //   title: 'Aquila Fest 2024',
    //   imageUrl: 'images/music.jpg',
    //   time: '08:30 PM',
    //   college_name: "GNI",
    //   about_event_title: 'About Event',
    //   about_event_content:
    //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
    //   price: "300",
    // ),
    // const Event(
    //   id: 'm2',
    //   categories: "c2",
    //   date: 'Oct 20 2023',
    //   title: 'Aquila Fest 2025',
    //   imageUrl: 'images/dance.jpg',
    //   time: '08:30 PM',
    //   college_name: "Hitam",
    //   about_event_title: 'About Event',
    //   about_event_content:
    //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
    //   price: "300",
    // ),
  //   Event(
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
  //   id: 'm4',
  //   // type: ["Near By Events","Popular Events"],
  //   categories: "c1",
  //   date: 'Sep 29 2023',
  //   title: 'Aquilla',
  //   imageUrl: 'images/dance.jpg',
  //   time: '06:00 PM',
  //   college_name: "SPEC",
  //   about_event_title: 'About Event',
  //   about_event_content:
  //       "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
  //   price: '800/team',
  // ),
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
  //     //type:'popular Events' ,
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



  static List<Event> getsuggestions(String query) =>
      List.of(Event_details).where((Event) {
        final userLower = Event.title.toLowerCase()+Event.college_name.toLowerCase();
        final queryLower = query.toLowerCase();

        return userLower.contains(queryLower);
      }).toList();
}
