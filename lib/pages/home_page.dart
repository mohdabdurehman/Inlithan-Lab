import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/coursesCard.dart';
import '../components/appBar.dart';
import '../components/activityCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = -1;

  final List<Map<String, String>> courses = [
    {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Economics for Engineers',
      'code': 'All 426',
    },
    {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Graduation Project',
      'code': 'COM 491',
    },
    {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Graduation Project',
      'code': 'COM 491',
    },
  ];

  final List<Map<String, String>> activities = [
    {
      'title': 'Quiz',
      'code': 'Economics for Engineers',
      'icon': 'assets/coursesIcon.png',
    },
    {
      'title': 'n',
      'code': 'Graduation Project',
      'icon': 'assets/coursesIcon.png',
    },
    {
      'title': 'test',
      'code': 'Graduation Project',
      'icon': 'assets/coursesIcon.png',
    },
    {
      'title': 'test',
      'code': 'Graduation Project',
      'icon': 'assets/coursesIcon.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // APP BAR
            SliverToBoxAdapter(child: Appbar(title: 'Courses')),

            // RESEARCH BOX
            // SliverToBoxAdapter(child: ResearchCard()),

            SliverToBoxAdapter(child: SizedBox(height: 32)),

            // COURSES TITLE
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text('Courses',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 24)),

            // COURSE CARDS GRID
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 32,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CourseCard(
                    imgIcon: Image.asset(courses[index]['img']!),
                    courseName: courses[index]['courseName']!,
                    code: courses[index]['code']!,
                  ),
                  childCount: courses.length,
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 64)),

            // ACTIVITIES HEADER
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text('Activities',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    const Spacer(),
                    Text('View More',
                        style: GoogleFonts.raleway(
                          color: Color(0xff00B764),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 24)),

            // ✅ HORIZONTAL LIST — works perfectly inside CustomScrollView
            SliverToBoxAdapter(
              child: SizedBox(
                height: 206,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) =>
                      true, // to prevent the bouncing effect
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    itemCount: activities.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 24),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex =
                                _selectedIndex == index ? -1 : index;
                          });
                        },
                        child: ActivitiesCard(
                          title: activities[index]['title']!,
                          coursename: activities[index]['code']!,
                          icon: Image.asset(activities[index]['icon']!),
                          filled: _selectedIndex == index,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),

      /// MY OWN ///
//       body: SafeArea(
//         child: SingleChildScrollView(
//           ///for neglecting the bounces but it didnt change anything

//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // APP BAR
//               const Appbar(title: 'Courses'),

//               // research box
//               const ResearchCard(),

//               const SizedBox(height: 32),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                 child: Text(
//                   'Courses',
//                   style: GoogleFonts.raleway(
//                     color: const Color(0xfffffffF),
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               //  COURSE CARDS
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 22),
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: courses.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, // 2 columns
//                       crossAxisSpacing: 24,
//                       mainAxisSpacing: 32,
//                       childAspectRatio: 1.0),
//                   itemBuilder: (context, index) {
//                     return CourseCard(
//                       imgIcon: Image.asset(courses[index]['img']!),
//                       courseName: courses[index]['courseName']!,
//                       code: courses[index]['code']!,
//                     );
//                   },
//                 ),
//               ),

//               const SizedBox(height: 64),

//               //  activities section
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                     child: Row(
//                       children: [
//                         Text('Activities',
//                             style: GoogleFonts.raleway(
//                               color: const Color(0xfffffffF),
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             )),
//                         const Spacer(),
//                         Text('View More',
//                             style: GoogleFonts.raleway(
//                               color: const Color(0xff00B764),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             )),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 24),

//                   //  activities cards
//                   SizedBox(
//                     height: 206,
//                     width: double.infinity,
//                     child: ListView.separated(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       itemCount: activities.length,
//                       primary: false,
//                       scrollDirection: Axis.horizontal,
//                       separatorBuilder: (__, _) => const SizedBox(width: 24),
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 if (_selectedIndex == index) {
//                                   _selectedIndex = -1; // Deselect
//                                 } else {
//                                   _selectedIndex = index; // Select new card
//                                 }
//                               });
//                             },
//                             child: ActivitiesCard(
//                               title: activities[index]['title']!,
//                               coursename: activities[index]['code']!,
//                               icon: Image.asset(activities[index]['icon']!),
//                               filled: _selectedIndex == index,
//                             ));
//                       },
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //  Research Card Widget
// class ResearchCard extends StatelessWidget {
//   const ResearchCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.symmetric(horizontal: 30),
//         decoration: BoxDecoration(
//           color: const Color(0xff1e212a),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _ResearchText(),
//                   _PreviewButton(),
//                 ])));
//   }
// }

// // Research text Widget
// class _ResearchText extends StatelessWidget {
//   const _ResearchText();

//   @override
//   Widget build(BuildContext context) {
//     return Text(' Research Papers \n for the week',
//         style: GoogleFonts.raleway(
//           color: const Color(0xfffeffff),
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//         ));
//   }
// }

// // Preview Button Widget
// class _PreviewButton extends StatelessWidget {
//   const _PreviewButton();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xff00B764),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Row(
//           children: [
//             Image.asset('assets/previewIcon.png'),
//             const SizedBox(width: 26),
//             Text('Preview',
//                 style: GoogleFonts.raleway(
//                   color: const Color(0xff191a1f),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 )),
//           ],
//         ),
//       ),
    );
  }
}
