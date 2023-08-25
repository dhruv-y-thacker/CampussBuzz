import 'package:campusbuzz/data/event_list.dart';
import 'package:campusbuzz/event_detail_screen.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:campusbuzz/homescreen.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:campusbuzz/event_explore_screen/explore_screen.dart';
import 'package:url_launcher/url_launcher.dart';


class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {

    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {

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

  void _toggleMealFavoriteStatus(Event event) {
    final isExisting = _favoriteEvent.contains(event);

    if (isExisting) {
      setState(() {
        _favoriteEvent.remove(event);
        _showInfoMessage('Removed from favorites');
      });
    } else { 
      setState(() {
        _favoriteEvent.add(event);
        _showInfoMessage('Added to favorites');
      });
    }
  }

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
     activePage = [
       Homescreen(onToggleFavorite: _toggleMealFavoriteStatus,event: Event_details, onselectevent: (Event event) { 
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailScreen(event: event, onToggleFavorite:_toggleMealFavoriteStatus,),
        ),
      );
        },),
      Explore(
        title: 'Explore',
        event: Event_details,
        onToggleFavorite: _toggleMealFavoriteStatus,
      ),
      Explore(
        event: _favoriteEvent,
        title: 'Favorites',
        onToggleFavorite: _toggleMealFavoriteStatus,
      ),
      Profile(),
    ];
    return Scaffold(
        body: PageView(
        controller: pageController,
        onPageChanged: _selectPage,
        children: activePage,
      ),
          bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.compassOutline,
                size: 35,
              ),
              label: ''),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_rounded,
                size: 35,
              ),
              label: ''),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 35,
              ),
              label: ''),
        ],
      ),
    );
  }
}

//profile page
_launchurl() async {
  var url = Uri.parse("https://www.youtube.com/playlist?list=WL");

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
                        child: const Padding(
                          padding: EdgeInsets.only(right: 19),
                          child: Center(
                              child: Text(
                            'version 0.0.1',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )),
                        ),
                      ); // Adjust
                    }
                    if (items[index] == 'hello') {
                      return Container(
                        height: 170,
                        color: const Color(0xfff5f5f5),
                        child: Row(
                          children: [
                            const SizedBox(width: 262, child: Text('newwwwww')),
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