import 'package:campusbuzz/categories.dart';
import 'package:campusbuzz/data/category_list.dart';
import 'package:campusbuzz/notification_sevices.dart';
import 'event_list.dart';
import 'package:campusbuzz/event_detail_screen.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:campusbuzz/notification.dart';
import 'package:campusbuzz/screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:campusbuzz/detail_page.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  const Homescreen(
      {super.key,
      required this.onToggleFavorite,
      required this.event,
      required this.onselectevent});
  final String url = 'https://www.example.com'; // Replace with your URL

  final List<Event> event;

  final void Function(Event event) onselectevent;

  final void Function(Event event) onToggleFavorite;
//category
  void _selectCategory(BuildContext context, Categori categori) {
    final filteredEvents =
        Event_details.where((evnt) => evnt.categories.contains(categori.id))
            .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => EventScreen(
          Ctitle: categori.Ctitle,
          events: filteredEvents,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  State<Homescreen> createState() {
    return _HomescreenState();
  }
}

bool showAllItems = false;

class _HomescreenState extends State<Homescreen> {
  //  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // notificationServices.requestNotificationPermission();
    // notificationServices.firebaseInit();
    // // notificationServices.isTokenRefresh();
    // notificationServices.getDeviceToken().then((value) {
    //   print('device token');
    //   print(value);
    // });
  }

  List imageList = [
    {"id": 4, "image_path": 'images/b1.jpeg'},
    {"id": 2, "image_path": 'images/b2.jpg'},
    {"id": 3, "image_path": 'images/b3.jpg'},
    {"id": 1, "image_path": 'images/hacktopia.png'}
  ];
  //category stuff

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (currentFocus.hasPrimaryFocus) ;
        currentFocus.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  child: Row(
                    //top bar

                    children: [
                      //sized box

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 20),
                        child: Image.asset(
                          "assets/images/loggo.png",
                          height: 65,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Notifications(),
                              ));
                        },
                        child: const Padding(
                            padding: EdgeInsets.only(left: 130, top: 18),
                            child: Icon(
                              Icons.notifications_none,
                              size: 30,
                            ) //Image.asset('svg/bell_3.png', width: 25),
                            ),
                      )
                    ],
                  ),
                ),

                // const SizedBox(
                //   height: 5,
                // ),

                //search bar

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Color.fromARGB(255, 255, 255, 255),
                //         borderRadius: BorderRadius.circular(23.5)),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 20,
                //       ),
                //       child: TextFormField(
                //         decoration: const InputDecoration(
                //           border: InputBorder.none,
                //           focusedBorder: InputBorder.none,
                //           hintText: 'Search anything...',
                //           hintStyle: TextStyle(color: Color(0xffC7C7C7)),
                //           prefixIcon: Icon(
                //             Icons.search,
                //             color: Color(0xffc7c7c7),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(23.5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TypeAheadField<Event?>(
                        hideSuggestionsOnKeyboardHide: true,
                        textFieldConfiguration: const TextFieldConfiguration(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search anything...',
                            hintStyle: TextStyle(color: Color(0xffC7C7C7)),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xffc7c7c7),
                            ),
                          ),
                        ),
                        //suggestionsCallback: EventData.getsuggestions,  dt
                        suggestionsCallback: (String query) async {
                          // Call the function to retrieve data from Firestore
                          final events = await gettingData();

                          // Filter events based on the query
                          return events
                              .where((event) => event.title
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList();
                        },
                        itemBuilder: (context, Event? suggestion) {
                          final event = suggestion!;

                          return ListTile(
                            leading: Image.asset(
                              event.imageUrl,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                            title: Text(event.title),
                            subtitle: Text(event.college_name),
                          );
                        },
                        noItemsFoundBuilder: (context) => Container(
                          height: 100,
                          child: const Center(
                            child: Text(
                              'No Matches Found.',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        onSuggestionSelected: (Event? suggestion) {
                          final event = suggestion!;

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => EventDetailScreen(
                                event: event,
                                onToggleFavorite: (event) {},
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //category

                SizedBox(
                  height: 55,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (final categori in AvailableCategories)
                        Categ(
                          categori: categori,
                          onSelectCategory: () {
                            widget._selectCategory(context, categori);
                          },
                        )
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                const SizedBox(height: 5),

                //running banner

                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        print(currentIndex);
                      },
                      child: CarouselSlider(
                        items: imageList
                            .map(
                              (item) => Image.asset(
                                item['image_path'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            )
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: currentIndex == entry.key ? 17 : 7,
                              height: 7.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == entry.key
                                      ? Color.fromARGB(255, 189, 29, 29)
                                      : const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                //nearby events title

                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 200),
                  child: Text(
                    'Near By Events',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff112031)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //nearby events list

                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.event.length,
                      itemBuilder: (ctx, index) {
                        final event = widget.event[index];
                        //if (event.type != null && event.type == 'Nearby Events'){
                        return
                            //1st event

                            Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.2),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: GestureDetector(
                                  //insted of inkwell using GestureDetector
                                  onTap: () {
                                    widget.onselectevent(event);
                                  }, //for navigations or any other function
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 210,
                                        height: 138,
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Hero(
                                                tag: "hero1",
                                                child: Image.asset(
                                                  event.imageUrl,
                                                  width: 210,
                                                  height: 138,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10, right: 10),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: InkWell(
                                                        onTap: () {
                                                          // Add your onPressed function here
                                                          print('Icon pressed');
                                                          widget
                                                              .onToggleFavorite(
                                                                  event);
                                                        },
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Icon(
                                                              Icons.favorite,
                                                              color: Color(
                                                                  0xffF81B1B),
                                                              size: 22),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      //event info

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      SizedBox(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 50, left: 5),
                                              child: Text(
                                                event.title,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 6, left: 3),
                                              child: SizedBox(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      size: 15,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      event.date,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    SizedBox(
                                                      width: 28,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      event.time,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        );
                        //                   else {
                        //   // Return an empty container for events with other types
                        //   return Container();
                        // }
                      }),
                ),

                //popular events title

                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    right: 200,
                  ),
                  child: Text(
                    'Popular Events',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff112031)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //popluar events

                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.event.length,
                      itemBuilder: (ctx, index) {
                        final event = widget.event[index];
                        //.if (event.type != null && event.type == 'popular Events'){
                        return
                            //1st event
                            Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.2),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: GestureDetector(
                                  //insted of inkwell using GestureDetector
                                  onTap: () {
                                    widget.onselectevent(event);
                                  }, //for navigations or any other function
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 210,
                                        height: 138,
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Hero(
                                                tag: "hero1",
                                                child: Image.asset(
                                                  event.imageUrl,
                                                  width: 210,
                                                  height: 138,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10, right: 10),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: InkWell(
                                                        onTap: () {
                                                          // Add your onPressed function here
                                                          print('Icon pressed');
                                                          widget
                                                              .onToggleFavorite(
                                                                  event);
                                                        },
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Icon(
                                                              Icons.favorite,
                                                              color: Color(
                                                                  0xffF81B1B),
                                                              size: 22),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      //event info

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      SizedBox(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 50, left: 5),
                                              child: Text(
                                                event.title,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 6, left: 3),
                                              child: SizedBox(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      size: 15,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      event.date,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    SizedBox(
                                                      width: 28,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      event.time,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        );
                        //                    else {
                        //   // Return an empty container for events with other types or null type
                        //   return Container();
                        // }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
