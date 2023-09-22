import 'package:campusbuzz/event_list.dart';
import 'package:campusbuzz/event_detail_screen.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:like_button/like_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:developer';





class Explore_list extends StatelessWidget {
  const Explore_list(
      {super.key,
      required this.event,
      required this.onselectevent,
      required this.onToggleFavorite});

  final Event event;
    


  final void Function(Event event) onselectevent;
  final void Function(Event event) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final eventLikeNotifier = Provider.of<EventLikeNotifier>(context);
    final isLiked = eventLikeNotifier.isLiked(event.id);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (currentFocus.hasPrimaryFocus);
        currentFocus.unfocus();
      },
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
             if (event == Event_details.first) // Add this condition
              // const Padding(
              //   padding: EdgeInsets.all(5),
              //   child: Column(
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.only(top: 15,bottom: 10),
              //         child: Text(
              //           'Explore',
              //           style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.w800,
              //             color: Color(0xffE93030),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            //search
             if (event == Event_details.first)
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
                                  suggestionsCallback: EventData.getsuggestions,
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
              
              
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: const Color.fromARGB(255, 255, 255, 255),
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
            InkWell(
              onTap: () {
                onselectevent(event);
              },
              child: Column(
                children: [
                  //event 1
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 280,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.2),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: GestureDetector(
                            //insted of inkwell using GestureDetector
                            // onTap: () {
                            //   print("event pressed");
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => Detail()));
                            // }, //for navigations or any other function
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 370,
                              height: 200,
                              child: Stack(
                                children: [
                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(15.0),
                                  //   child: FadeInImage(
                                  //     placeholder: MemoryImage(kTransparentImage),
                                  //     image:AssetImage(event.imageUrl),
                                  //     fit: BoxFit.cover,
    
                                  //     width: double.infinity,
                                  //   ),
                                  // ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Hero(
                                      tag: "hero1",
                                      child: Image.asset(
                                        event.imageUrl,
                                        width: 370,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 10),
                                          child: CircleAvatar(
                                    
                                            backgroundColor: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 2),
                                              child: LikeButton(
                                                isLiked: isLiked,
                                                onTap: (liked) async {
                                                  onToggleFavorite(event);
                                                  eventLikeNotifier
                                                      .toggleLike(event.id);
                                                  return !liked;
                                                },
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Text(
                                        event.title,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            event.date,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          Icon(
                                            Icons.watch_later_outlined,
                                            size: 20,
                                          ),
                                          Text(
                                            event.time,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
