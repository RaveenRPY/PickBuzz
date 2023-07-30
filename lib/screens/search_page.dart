import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickbuzz/screens/bus_list.dart';
import 'package:pickbuzz/screens/home_Screen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  late String startStop;
  // ignore: prefer_typing_uninitialized_variables
  late String endStop;
  late String route;

  final List<String> towns = [
    'Colombo',
    'Kadawatha',
    'Mirigama',
    'Kurunegala',
  ];

  void swapSelectedValues() {
    setState(() {
      String? temp = startStop;
      startStop = endStop;
      endStop = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 5,
        title: const Text(
          "Search Bus",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        surfaceTintColor: Colors.white,
        shadowColor: const Color.fromARGB(40, 154, 255, 233),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        shadowColor: const Color.fromARGB(255, 154, 255, 233),
        onDestinationSelected: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const HomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const SearchPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const SearchPage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const SearchPage(),
              ),
            );
          }
        },
        selectedIndex: 1,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_rounded),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.location_on_rounded),
            icon: Icon(Icons.location_on_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.airplane_ticket_rounded),
            icon: Icon(Icons.airplane_ticket_outlined),
            label: '',
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 215, 228, 255),
                              child:
                                  Icon(Iconsax.gps, color: Color(0xff4b83fe))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              hint: const Text(
                                'Choose start location',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 139, 139, 139),
                                ),
                              ),
                              items: towns
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select start location';
                                }
                                startStop = value;
                                return null;
                              },
                              onChanged: (value) {
                                selectedValue = value.toString();
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 24,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07,
                          )
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Iconsax.arrow_swap,
                            size: 26,
                            color: Color.fromARGB(255, 0, 129, 101),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 255, 224, 230),
                              child: Icon(Iconsax.location,
                                  color: Color.fromARGB(255, 180, 0, 39))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              hint: const Text(
                                'Choose destination',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 139, 139, 139),
                                ),
                              ),
                              items: towns
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select destination';
                                }
                                endStop = value;
                                return null;
                              },
                              onChanged: (value) {},
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 24,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              if (startStop == endStop) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    action: SnackBarAction(
                                      label: 'Got it',
                                      onPressed: () {
                                        setState(() {
                                          // startStop = null;
                                          // endStop = null;
                                        });
                                        // Code to execute.
                                      },
                                    ),
                                    content: const Text(
                                        'Start Location and Destination given are the same. Please change either of them!'),
                                    duration:
                                        const Duration(milliseconds: 50000),
                                    width: MediaQuery.of(context).size.width *
                                        0.95, // Width of the SnackBar.

                                    padding: const EdgeInsets.symmetric(
                                      horizontal:
                                          15.0, // Inner padding for SnackBar content.
                                      vertical: 8,
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                );
                              } else {
                                if (startStop == 'Colombo' &&
                                    endStop == 'Kurunegala') {
                                  setState(() {
                                    route = 'Bus-CK';
                                  });
                                } else if (startStop == 'Colombo' &&
                                    endStop == 'Mirigama') {
                                  setState(() {
                                    route = 'Bus-CM';
                                  });
                                } else if (startStop == 'Kadawatha' &&
                                    endStop == 'Kurunegala') {
                                  setState(() {
                                    route = 'Bus-DK';
                                  });
                                } else if (startStop == 'Kurunegala' &&
                                    endStop == 'Colombo') {
                                  setState(() {
                                    route = 'Bus-KC';
                                  });
                                } else if (startStop == 'Kurunegala' &&
                                    endStop == 'Kadawatha') {
                                  setState(() {
                                    route = 'Bus-KD';
                                  });
                                } else {
                                  setState(() {
                                    route = 'Bus-MC';
                                  });
                                }

                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: BusList(
                                      startStop:
                                          startStop, // Pass the startStop value to BusList
                                      endStop:
                                          endStop, // Pass the endStop value to BusList
                                      route: route,
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            'Search',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("lib/assets/Search/search.webp",
                  colorBlendMode: BlendMode.luminosity),
            ],
          ),
        ],
      ),
    );
  }
}
