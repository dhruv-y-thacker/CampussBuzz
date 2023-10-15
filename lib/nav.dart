// import 'package:campusbuzz/CampusBuzz%20Intro%20Screens/CampusBuzz%20Intro%20Screens/createaccount.dart';
// import 'package:campusbuzz/CampusBuzz%20Intro%20Screens/CampusBuzz%20Intro%20Screens/main.dart';
// import 'package:campusbuzz/CampusBuzz%20Intro%20Screens/CampusBuzz%20Intro%20Screens/welcomeback.dart';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:campusbuzz/FavProv.dart';
import 'package:campusbuzz/event_detail_screen.dart';
import 'package:campusbuzz/event_explore_screen/explore_screen.dart';
import 'package:campusbuzz/homescreen.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'event_list.dart';
import 'main.dart';



class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
 ConsumerState<TabsScreen> createState() {

    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {

  final List<Event> _favoriteEvent = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  //defin 
  List<Widget> activePage = [];

  // void _toggleMealFavoriteStatus(Event event) {
  //   final isExisting = _favoriteEvent.contains(event);

  //   if (isExisting) {
  //     setState(() {
  //       _favoriteEvent.remove(event);
  //       _showInfoMessage('Removed from favorites');
  //     });
  //   } else { 
  //     setState(() {
  //       _favoriteEvent.add(event);
  //       _showInfoMessage('Added to favorites');
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
    PageController pageController = PageController();
    void _onItemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
  }

  int _selectedPageIndex = 0;
  @override

  Widget build(BuildContext context) {
    final favoriteEvent = ref.watch(favoriteEventsProvider);
     activePage = [
       Homescreen(event: Event_details, onselectevent: (Event event) { 
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailScreen(event: event, ),
        ),
      );
        },),
      Explore(
        title: 'Explore',
        event: Event_details,
       
      ),
      Explore(
        event: favoriteEvent,
        title: 'Favorites',
        
      ),
      Profile(),
    ];
    return Scaffold(
        body: PageView(
        controller: pageController,
        onPageChanged: _selectPage,
        children: activePage,
      ),
          bottomNavigationBar: 
          //changed here
          Container(
            decoration: BoxDecoration(
              boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3), // Shadow color
          spreadRadius: 1, // Spread radius
          blurRadius: 13, // Blur radius
          offset: Offset(0, 0), // Offset in the x and y directions
        ),
      ],
            ),
            child: BottomNavigationBar(
                  currentIndex: _selectedPageIndex,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: const Color.fromARGB(255, 54, 46, 46),
                  // backgroundColor: Colors.black,
                  selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  onTap: _onItemTapped,
                  items: [
              BottomNavigationBarItem(
                
                icon: _selectedPageIndex == 0
            ? Icon(
                Icons.home,
                size: 35,
              )
            : Icon(
                Icons.home_outlined,
                size: 35,
              ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _selectedPageIndex == 1
            ? Icon(
                MdiIcons.compass,
                size: 35,
              )
            : Icon(
                MdiIcons.compassOutline,
                size: 35,
              ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: _selectedPageIndex == 2
            ? Icon(
                Icons.favorite,
                size: 35,
              )
            : Icon(
                Icons.favorite_border_rounded,
                size: 35,
              ),
                label: 'Liked',
              ),
              BottomNavigationBarItem(
                icon: _selectedPageIndex == 3
            ? Icon(
                Icons.person,
                size: 35,
              )
            : Icon(
                Icons.person_outline,
                size: 35,
              ),
                label: 'Profile',
              ),
            ],
                  type: BottomNavigationBarType.fixed,
                ),
          ),
    );
  }
}

//profile page
_launchurl() async {
  var url = Uri.parse("https://docs.google.com/forms/d/e/1FAIpQLScEhcRBVl_z4rjwyrrrBy3wqVcDuxEzx_MOAw-a30qgD5DjwQ/viewform");

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Cannot launch URL';
  }
}





class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _pickedImageFile;

  void logOutAccount(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) =>OnboardScreens()));}

  final List<String> items = [
    'hello',
    'My Profile',
    'Your Order',
    'Accont Setting',
    'Help Center',
    'Host Your Event',
    'Share',
    'Rate Us',
    'end'
  ];

  void _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    if (items[index] == 'end') {
                      return Container(
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.25),
                        ),
                        child:  Padding(
                          padding: EdgeInsets.only(right: 19),
                          child: Center(
                              child: ElevatedButton(onPressed:(){
                                AwesomeDialog(
                                         context: context,
            dialogType: DialogType.noHeader,
            animType: AnimType.rightSlide,
            title: 'Are you Sure?',
            desc: '',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
  
              logOutAccount(context);
            },
            )..show();
                                
                                
                              }, child: Text('Sign Out'))),
                        ),
                      ); // Adjust
                    }
                    if (items[index] == 'hello') {
                      return Container(
                        height: 170,
                        color: const Color(0xfff5f5f5),
                        child: Row(
                          children: [
                             SizedBox(width: 262, child: Container(
                              width: 100,
                              height: 100,
                            
                              child:const Padding(
                                padding:  EdgeInsets.only(top: 30,left: 15),
                                child:  Text('Hi Bobburi Umesh',style: TextStyle(
                                fontSize: 25,
                                color: Color( 0xffF81B1B),
                                fontWeight:FontWeight.bold ),
                                ),
                              )
                              )
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 7, top: 11),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: const Color.fromARGB(
                                          255, 158, 158, 158),
                                      foregroundImage: _pickedImageFile != null
                                          ? FileImage(_pickedImageFile!)
                                          : null,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            _pickImage(ImageSource.camera);
                                          },
                                          child: Container(
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _pickImage(ImageSource.gallery);
                                        },
                                        child: Container(
                                          child: const Icon(
                                            Icons.image,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    if (items[index] == 'Help Center') {
                      // Add a sized box after the "Help Center" list item
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: ListTile(
                                title: Text(items[index],
                                    style: const TextStyle(fontSize: 20)),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Help()),
                                  );
                                }),
                          ),
                          Container(
                            height: 70,
                            decoration:
                                BoxDecoration(border: Border.all(width: 0.25)),
                          ), // Adjust the height as needed
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: ListTile(
                              title: Text(
                                items[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyProfile()),
                                    );
                                    break;
                                  case 1:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Orders()),
                                    );
                                    break;
                                  case 2:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AccSetting()),
                                    );
                                    break;
                                  case 3:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Help()),
                                    );
                                    break;
                                  case 4:
                                    
                                    break;
                                  case 5:
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => const Share()),
                                    _launchurl();
                                    
                                    break;
                                  case 6:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Rate()),
                                    );
                                    break;
                                  // Repeat for other cases
                                  default:
                                    break;
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  })),
        ],
      ),
    );
  }
}



//profile page details


class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        );
  }
}

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('order'),
      ),
    );
  }
}

class AccSetting extends StatelessWidget {
  const AccSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('setting'),
      ),
    );
  }
}

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('help'),
      ),
    );
  }
}

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('offer'),
      ),
    );
  }
}

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('share'),
      ),
    );
  }
}

class Rate extends StatelessWidget {
  const Rate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Rate'),
      ),
    );
  }
}