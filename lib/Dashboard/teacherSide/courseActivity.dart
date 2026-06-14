import 'package:flutter/material.dart';
import '../../components/activityCard.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/appBar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../providers/activities_provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/courses_provider.dart';
import '../../config/api_config.dart';
import 'package:file_picker/file_picker.dart';

class CourseActivitiesT extends StatefulWidget {
  final Map<String, dynamic> course;

  const CourseActivitiesT({super.key, required this.course});

  @override
  State<CourseActivitiesT> createState() => CourseActivitiesTState();
}

class CourseActivitiesTState extends State<CourseActivitiesT> {
  // tracks which week is expanded
  int _expandedIndex = 0;
  int _selectedIndex = -1;
  bool _isLinkCopied = false;
  bool _isUploading = false;

  Future<void> _pickAndUploadPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result == null || result.files.single.path == null) return;

    final file = result.files.single;
    final token = context.read<AuthProvider>().token!;
    final courseId = widget.course['_id'];

    setState(() => _isUploading = true);

    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${ApiConfig.baseUrl}/courses/$courseId/upload'),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(
        await http.MultipartFile.fromPath('pdf', file.path!),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        // Refresh courses so this page gets the updated weeks list
        await context.read<CoursesProvider>().fetchCourses();
        final updated = context
            .read<CoursesProvider>()
            .courses
            .firstWhere((c) => c['_id'] == courseId, orElse: () => null);

        if (updated != null && mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CourseActivitiesT(course: updated),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(data['error'] ?? 'Upload failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final course = widget.course;
    final List<dynamic> weeks = course['weeks'] ?? [];
    final String courseTitle = course['title'] ?? '';
    final String aboutText = course['about'] ?? '';
    final List<dynamic> aboutPoints = course['aboutPoints'] ?? [];
    final String aboutClosing = course['aboutClosing'] ?? '';
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: Column(
          children: [
            Appbar(
                title: courseTitle,
                showSearch: false,
                leading: Icon(Icons.arrow_back_ios,
                    color: Color(0xff00b764), size: 28)),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 32),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color(0xff303530), width: 1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Student List',
                                    style: GoogleFonts.raleway(
                                      color: const Color(0xffffffff),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff00B764),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                                'assets/previewIcon.png'),
                                            const SizedBox(width: 26),
                                            Text("View Student List",
                                                style: GoogleFonts.raleway(
                                                  color:
                                                      const Color(0xff191a1f),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => StatefulBuilder(
                                          builder: (context, setDialogState) {
                                        return Dialog(
                                          backgroundColor:
                                              const Color(0xff191a1f),
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Color(0xff00b764),
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(24),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // ── Header ──
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Student Invite',
                                                        style:
                                                            GoogleFonts.raleway(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        )),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setDialogState(
                                                          () {
                                                            _isLinkCopied =
                                                                false;
                                                          },
                                                        );

                                                        Navigator.pop(context);
                                                      },
                                                      child: const Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                          size: 20),
                                                    ),
                                                  ],
                                                ),

                                                const SizedBox(height: 32),

                                                // ── Description ──
                                                Text(
                                                  'In order for students from your university or cohort to join course they need this link:',
                                                  style: GoogleFonts.raleway(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),

                                                const SizedBox(height: 32),

                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 16),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff152826),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Text(
                                                    'https://inlithanlabs.com/course/69d2920ca7841592ca167ec8',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                const SizedBox(height: 32),
                                                GestureDetector(
                                                  onTap: () {
                                                    setDialogState(() {
                                                      _isLinkCopied = true;
                                                    });
                                                  },
                                                  child: Center(
                                                    child: _isLinkCopied
                                                        ? Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Color(
                                                                      0xff00b764),
                                                                  size: 20),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Text(
                                                                  'Link Copied!',
                                                                  style: GoogleFonts
                                                                      .raleway(
                                                                    color: const Color(
                                                                        0xff00b764),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  )),
                                                            ],
                                                          )
                                                        : Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Image.asset(
                                                                  'assets/copyLink.png'),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text('Copy Link',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Color(
                                                                          0xff00b764),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                            ],
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.add,
                                    color: Color(0xff00b764), size: 18),
                                SizedBox(
                                  width: 4,
                                ),
                                Text('Invite Students',
                                    style: GoogleFonts.raleway(
                                        color: Color(0xff00b764),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          )
                        ],
                      ),
                    ),
                  ),

                  // COURSE ACTIVITIES TITLE
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Course Activities',
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500)),
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Go to the Activities tab to create one'),
                                  backgroundColor: Color(0xff00b764),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.add,
                                    color: Color(0xff00b764), size: 18),
                                SizedBox(width: 4),
                                Text('Create',
                                    style: GoogleFonts.raleway(
                                        color: Color(0xff00b764),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  ACTIVITY CARDS (filtered to this course)
                  SliverToBoxAdapter(
                    child: Builder(builder: (context) {
                      final allActivities =
                          context.watch<ActivitiesProvider>().activities;
                      final courseActivities = allActivities.where((a) {
                        final activityCourseId = a['courseId'] is Map
                            ? a['courseId']['_id']
                            : a['courseId'];
                        return activityCourseId == course['_id'];
                      }).toList();

                      if (courseActivities.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'No activities for this course yet.',
                            style: GoogleFonts.raleway(
                              color: const Color(0xff8C8D8F),
                              fontSize: 14,
                            ),
                          ),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children:
                              courseActivities.asMap().entries.map((entry) {
                            final index = entry.key;
                            final activity = entry.value;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex =
                                      _selectedIndex == index ? -1 : index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ActivitiesCard(
                                    title: activity['type'] ?? '',
                                    coursename: activity['title'] ?? '',
                                    icon: Image.asset('assets/coursesIcon.png'),
                                    filled: _selectedIndex == index,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }),
                  ),

                  //  CURRICULUM TITLE + UPLOAD BUTTON
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 32, 30, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Curriculum',
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500)),
                          GestureDetector(
                            onTap: _isUploading ? null : _pickAndUploadPdf,
                            child: Row(
                              children: [
                                _isUploading
                                    ? const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Color(0xff00b764),
                                        ),
                                      )
                                    : Icon(Icons.upload_file,
                                        color: Color(0xff00b764), size: 18),
                                SizedBox(width: 6),
                                Text(
                                  _isUploading ? 'Processing...' : 'Upload PDF',
                                  style: GoogleFonts.raleway(
                                      color: Color(0xff00b764),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  WEEK ITEMS
                  if (weeks.isEmpty)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        child: Text(
                          'No weeks yet. Upload a PDF to generate the first week.',
                          style: GoogleFonts.raleway(
                            color: const Color(0xff8C8D8F),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  else
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final week = weeks[index];
                          final bool isExpanded = _expandedIndex == index;
                          return _WeekTile(
                            weeknum: week,
                            isExpanded: isExpanded,
                            onTap: () => setState(
                                () => _expandedIndex = isExpanded ? -1 : index),
                          );
                        },
                        childCount: weeks.length,
                      ),
                    ),

                  //  ABOUT SECTION
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 160),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('About This Course',
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                              Row(
                                children: [
                                  Icon(Icons.edit,
                                      color: Color(0xff00b764), size: 18),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Edit',
                                      style: GoogleFonts.raleway(
                                          color: Color(0xff00b764),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Text(
                            aboutText.isNotEmpty
                                ? aboutText
                                : 'No description added yet.',
                            style: GoogleFonts.raleway(
                                color: const Color(0xff8C8D8F), fontSize: 20),
                          ),
                          if (aboutPoints.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            ...aboutPoints.map((point) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text('• $point',
                                      style: GoogleFonts.raleway(
                                          color: const Color(0xff8C8D8F),
                                          fontSize: 16)),
                                )),
                          ],
                          if (aboutClosing.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            Text(aboutClosing,
                                style: GoogleFonts.raleway(
                                    color: const Color(0xff8C8D8F),
                                    fontSize: 16)),
                          ],
                        ],
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

// WEEK TILE WIDGET

class _WeekTile extends StatelessWidget {
  final Map<String, dynamic> weeknum;
  final bool isExpanded;
  final VoidCallback onTap;

  const _WeekTile(
      {required this.weeknum, required this.isExpanded, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xff191A1F),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isExpanded ? const Color(0xff00B764) : const Color(0xff152826),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Header row
            Container(
              decoration: BoxDecoration(
                color: isExpanded
                    ? const Color(0xff00B764)
                    : const Color(0xff191A1F),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Row(
                children: [
                  Text('Week ${weeknum['number'] ?? ''}:  ',
                      style: GoogleFonts.raleway(
                        color: isExpanded
                            ? const Color(0xff191a1f)
                            : const Color(0xff8C8D8F),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  Expanded(
                    child: Text(weeknum['title'] ?? '',
                        style: GoogleFonts.raleway(
                          color: isExpanded
                              ? const Color(0xff191a1f)
                              : const Color(0xff8C8D8F),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: isExpanded
                        ? const Color(0xff191a1f)
                        : const Color(0xff00B764), // ✅ white on green
                    size: 22,
                  ),
                ],
              ),
            ),

            //  Expanded content
            if (isExpanded) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(weeknum['description'] ?? '',
                        style: GoogleFonts.raleway(
                          color: const Color(0xff8C8D8F),
                          fontSize: 16,
                        )),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xff152826),
                            side: const BorderSide(
                                color: Color(0xff00B764), width: 1.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                          ),
                          child: Text('View',
                              style: GoogleFonts.raleway(
                                  fontSize: 24,
                                  color: const Color(0xff00B764),
                                  fontWeight: FontWeight.w700)),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xff152826),
                            side: const BorderSide(
                                color: Color(0xff00B764), width: 1.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                          ),
                          child: Text('Edit',
                              style: GoogleFonts.raleway(
                                  fontSize: 24,
                                  color: const Color(0xff00B764),
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
