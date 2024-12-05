// // import 'package:flutter/material.dart';

// // void main() => runApp(const DismissibleExampleApp());

// // class DismissibleExampleApp extends StatelessWidget {
// //   const DismissibleExampleApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         appBar: AppBar(title: Text('Dismissible Sample')),

// //         body: const DismissibleExample(),
// //       ),
// //     );
// //   }
// // }

// // class DismissibleExample extends StatefulWidget {
// //   const DismissibleExample({super.key});

// //   @override
// //   State<DismissibleExample> createState() => _DismissibleExampleState();
// // }

// // class _DismissibleExampleState extends State<DismissibleExample> {
// //   List<int> items = List<int>.generate(30, (int index) => index);
// //   List<int> savedItems = []; // To store saved items

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         // Main List with Dismissible items
// //         Expanded(
// //           child: ListView.builder(
// //             itemCount: items.length,
// //             padding: const EdgeInsets.symmetric(vertical: 16),
// //             itemBuilder: (BuildContext context, int index) {
// //               return Dismissible(
// //                 background: Container(
// //                   color: Colors.green, // Background color when swiped right to left
// //                 ),
// //                 secondaryBackground: Container(
// //                   color: Colors.red, // Background color when swiped left to right
// //                 ),
// //                 key: ValueKey<int>(items[index]),
// //                 onDismissed: (DismissDirection direction) {
// //                   if (direction == DismissDirection.startToEnd) {
// //                     // Swipe from left to right, eliminate the item
// //                     setState(() {
// //                       items.removeAt(index);
// //                     });
// //                   } else if (direction == DismissDirection.endToStart) {
// //                     // Swipe from right to left, save the item
// //                     setState(() {
// //                       savedItems.add(items[index]);
// //                       items.removeAt(index);
// //                     });
// //                   }
// //                 },
// //                 child: ListTile(
// //                   title: Text('Item ${items[index]}'),
// //                 ),
// //               );
// //             },
// //           ),
// //         ),
// //         // Display the saved list
// //         Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const Text(
// //                 'Saved Items:',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               ...savedItems.map((savedItem) => ListTile(
// //                     title: Text('Saved Item $savedItem'),
// //                   )),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // void main() async {
// //   var response = await http.post(
// //     Uri.parse('https://jsonplaceholder.typicode.com/posts'),
// //     headers: {'Content-Type': 'application/json'},
// //     body: jsonEncode({'title': 'Flutter Networking', 'body': 'Learning Dart HTTP'}),
// //   );

// //   if (response.statusCode == 201) {
// //     print('Data posted successfully!');
// //   } else {
// //     print('Failed to post data: ${response.statusCode}');
// //   }
// // }
// import 'package:flutter/material.dart';

// /// Flutter code sample for [AppBar].

// final List<int> _items = List<int>.generate(51, (int index) => index);

// void main() => runApp(const AppBarApp());

// class AppBarApp extends StatelessWidget {
//   const AppBarApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         colorSchemeSeed: const Color(0xff6750a4),
//         useMaterial3: true,
//       ),
//       home: const AppBarExample(),
//     );
//   }
// }

// class AppBarExample extends StatefulWidget {
//   const AppBarExample({super.key});

//   @override
//   State<AppBarExample> createState() => _AppBarExampleState();
// }

// class _AppBarExampleState extends State<AppBarExample> {
//   bool shadowColor = false;
//   double? scrolledUnderElevation;

//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme colorScheme = Theme.of(context).colorScheme;
//     final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
//     final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AppBar Demo'),
//         scrolledUnderElevation: scrolledUnderElevation,
//         shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
//       ),
//       body: GridView.builder(
//         itemCount: _items.length,
//         padding: const EdgeInsets.all(8.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           childAspectRatio: 2.0,
//           mainAxisSpacing: 10.0,
//           crossAxisSpacing: 10.0,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           if (index == 0) {
//             return Center(
//               child: Text(
//                 'Scroll to see the Appbar in effect.',
//                 style: Theme.of(context).textTheme.labelLarge,
//                 textAlign: TextAlign.center,
//               ),
//             );
//           }
//           return Container(
//             alignment: Alignment.center,
//             // tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20.0),
//               color: _items[index].isOdd ? oddItemColor : evenItemColor,
//             ),
//             child: Text('Item $index'),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: OverflowBar(
//             overflowAlignment: OverflowBarAlignment.center,
//             alignment: MainAxisAlignment.center,
//             overflowSpacing: 5.0,
//             children: <Widget>[
//               ElevatedButton.icon(
//                 onPressed: () {
//                   setState(() {
//                     shadowColor = !shadowColor;
//                   });
//                 },
//                 icon: Icon(
//                   shadowColor ? Icons.visibility_off : Icons.visibility,
//                 ),
//                 label: const Text('shadow color'),
//               ),
//               const SizedBox(width: 5),
//               ElevatedButton(
//                 onPressed: () {
//                   if (scrolledUnderElevation == null) {
//                     setState(() {
//                       // Default elevation is 3.0, increment by 1.0.
//                       scrolledUnderElevation = 4.0;
//                     });
//                   } else {
//                     setState(() {
//                       scrolledUnderElevation = scrolledUnderElevation! + 1.0;
//                     });
//                   }
//                 },
//                 child: Text(
//                   'scrolledUnderElevation: ${scrolledUnderElevation ?? 'default'}',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/*import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter Layout Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Image(
                //image: AssetImage('images/lake.jpg'),
                image: NetworkImage('data:image/jpeg;base64,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'),
                width: double.infinity,
                height: 200, // Adjusted for smaller screens
                fit: BoxFit.cover,
              ),

              // Title Section
              Padding(
                padding: EdgeInsets.all(16), // Reduced padding
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4), // Adjusted spacing
                            child: Text(
                              'Oeschinen Lake Campground',
                              style: TextStyle(
                                fontSize: 18, // Adjusted for readability
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Kandersteg, Switzerland',
                            style: TextStyle(
                              fontSize: 14, // Adjusted font size
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.star, color: Colors.red, size: 20),
                    SizedBox(width: 4), // Spacing between icon and text
                    Text(
                      '41',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              // Button Section
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.call, color: Colors.blue, size: 24),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'CALL',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.near_me, color: Colors.blue, size: 24),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'ROUTE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.share, color: Colors.blue, size: 24),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'SHARE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Text Section
              Padding(
                padding: EdgeInsets.all(16), // Reduced padding
                child: Text(
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                  'Bernese Alps. Situated 1,578 meters above sea level, it '
                  'is one of the larger Alpine Lakes. A gondola ride from '
                  'Kandersteg, followed by a half-hour walk through pastures '
                  'and pine forest, leads you to the lake, which warms to 20 '
                  'degrees Celsius in the summer. Activities enjoyed here '
                  'include rowing, and riding the summer toboggan run.',
                  style: TextStyle(fontSize: 14), // Adjusted font size
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
// import 'package:flutter/material.dart';

// void main() => runApp(const SpacedItemsList());

// class SpacedItemsList extends StatelessWidget {
//   const SpacedItemsList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const items = 4;

//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         cardTheme: CardTheme(color: Colors.blue.shade50),
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//         body: LayoutBuilder(builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxHeight),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: List.generate(
//                     items, (index) => ItemWidget(text: 'Item $index')),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// class ItemWidget extends StatelessWidget {
//   const ItemWidget({
//     super.key,
//     required this.text,
//   });

//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SizedBox(
//         height: 100,
//         child: Center(child: Text(text)),
//       ),
//     );
//   }
// }
/*import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Navigation',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: ResponsiveNavigation(),
      ),
    );
  }
}

class ResponsiveNavigation extends StatelessWidget {
  const ResponsiveNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the width of the screen
    final width = MediaQuery.sizeOf(context).width;

    // Choose NavigationBar or NavigationRail based on screen width
    if (width < 600) {
      return const NavigationBarView();
    } else {
      return const NavigationRailView();
    }
  }
}

// Widget for small screen navigation using NavigationBar
class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationBar View'),
      ),
      body: const Center(
        child: Text(
          'This is the NavigationBar view.',
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// Widget for large screen navigation using NavigationRail
class NavigationRailView extends StatefulWidget {
  const NavigationRailView({super.key});

  @override
  State<NavigationRailView> createState() => _NavigationRailViewState();
}

class _NavigationRailViewState extends State<NavigationRailView> {
  int _selectedIndex = 0; // Keep track of the selected destination

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationRail View'),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Display content based on the selected destination
          Expanded(
            child: Center(
              child: Text(
                'Selected: ${_selectedIndex == 0 ? 'Home' : _selectedIndex == 1 ? 'Search' : 'Settings'}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';

void main() {
  runApp(const SafeAreaExampleApp());
}

class SafeAreaExampleApp extends StatelessWidget {
  const SafeAreaExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const SafeAreaExample(),
      ),
    );
  }
}

class SafeAreaExample extends StatelessWidget {
  const SafeAreaExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue,
            child: const Text(
              'SafeArea Example',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          // Body content
          Expanded(
            child: Container(
              color: Colors.green[100],
              child: const Center(
                child: Text(
                  'This area is safe from system UI and cutouts.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Footer
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.red,
            child: const Text(
              'Footer Content',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';

void main() {
  runApp(const GridBuilderExampleApp());
}

class GridBuilderExampleApp extends StatelessWidget {
  const GridBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GridBuilderExample(),
    );
  }
}

class GridBuilderExample extends StatelessWidget {
  const GridBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data
    final List<Map<String, String>> items = List.generate(
      20,
      (index) => {
        'title': 'Item $index',
        'image': 'https://via.placeholder.com/150', // Placeholder image URL
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Builder Example'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Horizontal spacing
          mainAxisSpacing: 10.0, // Vertical spacing
          childAspectRatio: 3 / 2, // Aspect ratio of items
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item['title']} clicked!')),
              );
            },
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      item['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';

void main() => runApp(const NavigationExample());

class NavigationExample extends StatelessWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldWithNav(),
    );
  }
}

class ScaffoldWithNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Example')),
      body: Center(child: const Text('Content goes here')),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Large screen -> use NavigationRail
            return NavigationRail(
              selectedIndex: 0,
              destinations: [
                NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(icon: Icon(Icons.search), label: Text('Search')),
                NavigationRailDestination(icon: Icon(Icons.notifications), label: Text('Notifications')),
              ],
            );
          } else {
            // Small screen -> use BottomNavigationBar
            return BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
              ],
            );
          }
        },
      ),
    );
  }
}
*/
/*import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class AdaptiveScreenExample extends StatefulWidget {
  @override
  State<AdaptiveScreenExample> createState() => _AdaptiveScreenExampleState();
}

class _AdaptiveScreenExampleState extends State<AdaptiveScreenExample>
    with WidgetsBindingObserver {
  ui.FlutterView? _view;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Add observer
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize _view in didChangeDependencies, where context is safe
    _view = View.maybeOf(context);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics(); // Properly override this from WidgetsBindingObserver
    final ui.Display? display = _view?.display;
    if (display != null) {
      final size = display.size;
      final pixelRatio = display.devicePixelRatio;
      // print('Physical screen size: ${size.width} x ${size.height}');
      // print('Device Pixel Ratio: $pixelRatio');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Clean up observer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adaptive Screen Example')),
      body: Center(
        child: Text('Resize the screen or change orientation to see metrics.'),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: AdaptiveScreenExample()));
*/
/*import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CustomScrollExample extends StatefulWidget {
  @override
  _CustomScrollExampleState createState() => _CustomScrollExampleState();
}

class _CustomScrollExampleState extends State<CustomScrollExample> {
  double _scrollOffset = 0.0;

  void _handleScroll(double delta) {
    setState(() {
      _scrollOffset += delta;
      if (_scrollOffset < 0) _scrollOffset = 0; // Prevent negative scrolling
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Scroll Example')),
      body: Listener(
        onPointerSignal: (PointerSignalEvent event) {
          // Check if the event is a scroll event
          if (event is PointerScrollEvent) {
            _handleScroll(event.scrollDelta.dy);
          }
        },
        child: Stack(
          children: [
            Positioned(
              top: -_scrollOffset, // Adjust the position based on scroll
              left: 0,
              right: 0,
              child: Column(
                children: List.generate(
                  30,
                  (index) => Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.blue[100 * ((index % 9) + 1)],
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                      'Item $index',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Text(
                'Scroll Offset: ${_scrollOffset.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: CustomScrollExample()));
}
*/

/*
import 'package:flutter/material.dart';

class TabTraversalExample extends StatefulWidget {
  @override
  _TabTraversalExampleState createState() => _TabTraversalExampleState();
}

class _TabTraversalExampleState extends State<TabTraversalExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Traversal Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CustomFocusableWidget(label: 'Button 1'),
            const SizedBox(height: 20),
            _CustomFocusableWidget(label: 'Button 2'),
            const SizedBox(height: 20),
            _CustomFocusableWidget(label: 'Button 3'),
          ],
        ),
      ),
    );
  }
}

class _CustomFocusableWidget extends StatefulWidget {
  final String label;

  const _CustomFocusableWidget({required this.label});

  @override
  _CustomFocusableWidgetState createState() => _CustomFocusableWidgetState();
}

class _CustomFocusableWidgetState extends State<_CustomFocusableWidget> {
  bool _hasFocus = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onFocusChange: (isFocused) {
        setState(() {
          _hasFocus = isFocused;
        });
      },
      onShowHoverHighlight: (isHovered) {
        setState(() {
          _isHovered = isHovered;
        });
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<Intent>(
          onInvoke: (intent) {
            // Perform an action when Enter or Space is pressed
            print('${widget.label} activated!');
            return null;
          },
        ),
      },
      child: GestureDetector(
        onTap: () {
          print('${widget.label} clicked!');
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _hasFocus ? Colors.blue[100] : Colors.grey[300],
            border: Border.all(
              color: _isHovered ? Colors.blue : (_hasFocus ? Colors.blue : Colors.transparent),
              width: 2,
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(fontSize: 18, color: _hasFocus ? Colors.blue[800] : Colors.black),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: TabTraversalExample()));
}
*/
/*import 'package:flutter/material.dart';

class FocusTraversalExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus Traversal Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FocusTraversalGroup(
              child: MyFormWithMultipleColumnsAndRows(),
            ),
            const SizedBox(height: 20),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class MyFormWithMultipleColumnsAndRows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Two columns
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: const [
        CustomTextField(label: 'First Name'),
        CustomTextField(label: 'Last Name'),
        CustomTextField(label: 'Email'),
        CustomTextField(label: 'Phone Number'),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Submit action
        print('Form Submitted!');
      },
      child: const Text('Submit'),
    );
  }
}

void main() => runApp(MaterialApp(home: FocusTraversalExample()));
*/
/*import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDisambiguationExample(),
    );
  }
}

class GestureDisambiguationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gesture Disambiguation Example")),
      body: Center(
        child: GestureDetector(
          onVerticalDragStart: (details) {
            print("Vertical drag started!");
          },
          onTap: () {
            print("Tapped!");
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "Tap or Drag",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
*/
//Drag and drop
/*import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: DragAndDropExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class DragAndDropExample extends StatefulWidget {
  const DragAndDropExample({Key? key}) : super(key: key);

  @override
  State<DragAndDropExample> createState() => _DragAndDropExampleState();
}

class _DragAndDropExampleState extends State<DragAndDropExample> {
  final List<Item> _menuItems = [
    Item('Spinach Pizza', 1299, 'https://docs.flutter.dev/cookbook/img-files/effects/split-check/Food1.jpg'),
    Item('Veggie Delight', 799, 'https://docs.flutter.dev/cookbook/img-files/effects/split-check/Food2.jpg'),
    Item('Chicken Parmesan', 1499, 'https://docs.flutter.dev/cookbook/img-files/effects/split-check/Food3.jpg'),
  ];

  final List<Customer> _customers = [
    Customer('Makayla', 'https://docs.flutter.dev/cookbook/img-files/effects/split-check/Avatar1.jpg'),
    Customer('Nathan', 'https://docs.flutter.dev/cookbook/img-files/effects/split-check/Avatar2.jpg'),
    Customer('Emilio', 'https://docs.flutter.dev/cookbook/img-files/effects/split-check/Avatar3.jpg'),
  ];

  void _onDropItem(Customer customer, Item item) {
    setState(() {
      customer.items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Food')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _menuItems.length,
              itemBuilder: (context, index) {
                final item = _menuItems[index];
                return LongPressDraggable<Item>(
                  data: item,
                  feedback: Image.network(item.imageUrl, height: 100),
                  child: Card(
                    child: ListTile(
                      leading: Image.network(item.imageUrl),
                      title: Text(item.name),
                      subtitle: Text('\$${(item.price / 100).toStringAsFixed(2)}'),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            children: _customers.map((customer) {
              return Expanded(
                child: DragTarget<Item>(
                  onAccept: (item) => _onDropItem(customer, item),
                  builder: (context, candidateData, rejectedData) {
                    return Card(
                      color: candidateData.isNotEmpty ? Colors.orange : Colors.white,
                      child: Column(
                        children: [
                          Image.network(customer.imageUrl, height: 50),
                          Text(customer.name),
                          if (customer.items.isNotEmpty) ...[
                            Text('Total: \$${(customer.totalPrice / 100).toStringAsFixed(2)}'),
                            Text('${customer.items.length} items'),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String name;
  final int price;
  final String imageUrl;

  Item(this.name, this.price, this.imageUrl);
}

class Customer {
  final String name;
  final String imageUrl;
  final List<Item> items = [];

  Customer(this.name, this.imageUrl);

  int get totalPrice => items.fold(0, (sum, item) => sum + item.price);
}
*/
/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text field that also has buttons to select all the text and copy the
/// selected text to the clipboard.
class CopyableTextField extends StatefulWidget {
  const CopyableTextField({super.key, required this.title});

  final String title;

  @override
  State<CopyableTextField> createState() => _CopyableTextFieldState();
}

class _CopyableTextFieldState extends State<CopyableTextField> {
  late final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      dispatcher: LoggingActionDispatcher(),
      actions: <Type, Action<Intent>>{
        ClearIntent: ClearAction(controller),
        CopyIntent: CopyAction(controller),
        SelectAllIntent: SelectAllAction(controller),
      },
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Row(
              children: <Widget>[
                const Spacer(),
                Expanded(
                  child: TextField(controller: controller),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed:
                      Actions.handler<CopyIntent>(context, const CopyIntent()),
                ),
                IconButton(
                  icon: const Icon(Icons.select_all),
                  onPressed: Actions.handler<SelectAllIntent>(
                      context, const SelectAllIntent()),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      }),
    );
  }
}

/// A ShortcutManager that logs all keys that it handles.
class LoggingShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, KeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    if (result == KeyEventResult.handled) {
      print('Handled shortcut $event in $context');
    }
    return result;
  }
}

/// An ActionDispatcher that logs all the actions that it invokes.
class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);

    return null;
  }
}

/// An intent that is bound to ClearAction in order to clear its
/// TextEditingController.
class ClearIntent extends Intent {
  const ClearIntent();
}

/// An action that is bound to ClearIntent that clears its
/// TextEditingController.
class ClearAction extends Action<ClearIntent> {
  ClearAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant ClearIntent intent) {
    controller.clear();

    return null;
  }
}

/// An intent that is bound to CopyAction to copy from its
/// TextEditingController.
class CopyIntent extends Intent {
  const CopyIntent();
}

/// An action that is bound to CopyIntent that copies the text in its
/// TextEditingController to the clipboard.
class CopyAction extends Action<CopyIntent> {
  CopyAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant CopyIntent intent) {
    final String selectedString = controller.text.substring(
      controller.selection.baseOffset,
      controller.selection.extentOffset,
    );
    Clipboard.setData(ClipboardData(text: selectedString));

    return null;
  }
}

/// An intent that is bound to SelectAllAction to select all the text in its
/// controller.
class SelectAllIntent extends Intent {
  const SelectAllIntent();
}

/// An action that is bound to SelectAllAction that selects all text in its
/// TextEditingController.
class SelectAllAction extends Action<SelectAllIntent> {
  SelectAllAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant SelectAllIntent intent) {
    controller.selection = controller.selection.copyWith(
      baseOffset: 0,
      extentOffset: controller.text.length,
      affinity: controller.selection.affinity,
    );

    return null;
  }
}

/// The top level application class.
///
/// Shortcuts defined here are in effect for the whole app,
/// although different widgets may fulfill them differently.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'Shortcuts and Actions Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.escape): const ClearIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC):
              const CopyIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
              const SelectAllIntent(),
        },
        child: const CopyableTextField(title: title),
      ),
    );
  }
}

void main() => runApp(const MyApp());
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Focus System Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const FocusDemoScreen(),
    );
  }
}

class FocusDemoScreen extends StatefulWidget {
  const FocusDemoScreen({super.key});

  @override
  State<FocusDemoScreen> createState() => _FocusDemoScreenState();
}

class _FocusDemoScreenState extends State<FocusDemoScreen> {
  final FocusNode _node1 = FocusNode(debugLabel: 'Node 1');
  final FocusNode _node2 = FocusNode(debugLabel: 'Node 2');
  final FocusNode _node3 = FocusNode(debugLabel: 'Node 3');

  @override
  void dispose() {
    // Dispose focus nodes to avoid memory leaks.
    _node1.dispose();
    _node2.dispose();
    _node3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus System Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Autofocus-enabled custom widget
            Focus(
              autofocus: true,
              focusNode: _node1,
              onFocusChange: (focused) {
                print('Node 1 focused: $focused');
              },
              child: CustomFocusableWidget(
                label: 'Focusable Widget 1 (Autofocus)',
              ),
            ),
            const SizedBox(height: 16),
            // Custom widget with key event handling
            Focus(
              focusNode: _node2,
              onKeyEvent: (node, event) {
                if (event.logicalKey == LogicalKeyboardKey.keyA) {
                  print('Key "A" pressed on Node 2');
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: CustomFocusableWidget(
                label: 'Focusable Widget 2 (Key Handling)',
              ),
            ),
            const SizedBox(height: 16),
            // Widget with traversal control
            Focus(
              focusNode: _node3,
              skipTraversal: true, // This widget is skipped in tab traversal
              child: CustomFocusableWidget(
                label: 'Focusable Widget 3 (Skip Traversal)',
              ),
            ),
            const SizedBox(height: 16),
            // TextField demonstrating restricted key input
            Focus(
              onKeyEvent: (node, event) {
                if (event.logicalKey == LogicalKeyboardKey.keyB) {
                  print('Key "B" is blocked in the TextField');
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'TextField (Blocks key "B")',
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Button to explicitly request focus
            ElevatedButton(
              onPressed: () {
                _node1.requestFocus();
              },
              child: const Text('Focus Widget 1'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFocusableWidget extends StatelessWidget {
  final String label;

  const CustomFocusableWidget({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Fade in images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Stack(
          children: <Widget>[
            const Center(child: CircularProgressIndicator()),
            Center(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://picsum.photos/250?image=9',
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/



//Navigation using go router
/*import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

// Define the router
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);

// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/profile');
              },
              child: const Text('Go to Profile Screen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/search');
              },
              child: const Text('Go to Search Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go('/');
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

// Search Screen
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go('/');
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
*/

// Navigating using both navigator and go router
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

// Define the GoRouter instance
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);

// Home Screen using Navigator and GoRouter
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate using GoRouter
                GoRouter.of(context).go('/profile');
              },
              child: const Text('Go to Profile Screen (GoRouter)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate using Navigator
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: const Text('Go to Search Screen (Navigator)'),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Screen using GoRouter
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back using GoRouter
            GoRouter.of(context).go('/');
          },
          child: const Text('Back to Home (GoRouter)'),
        ),
      ),
    );
  }
}

// Search Screen using Navigator
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back using Navigator
            Navigator.pop(context);
          },
          child: const Text('Back to Home (Navigator)'),
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passing Data',
      home: TodosScreen(
        todos: List.generate(
          20,
          (i) => Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ),
        ),
      ),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailScreen(),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: todos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(todo.description),
      ),
    );
  }
}*/

