import 'package:flutter/material.dart';
import 'package:mobile_version/Dashboard/teacherSide/components/coursesCard.dart';
import '../../../components/appBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../providers/courses_provider.dart';
import '../../providers/auth_provider.dart';
import '../../services/courses_service.dart';
import 'courseActivity.dart';

class CoursesPageT extends StatelessWidget {
  const CoursesPageT({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = context.watch<CoursesProvider>().courses;
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // APP BAR
            Appbar(
                title: 'Courses',
                showIcon: Stack(children: [
                  Icon(Icons.notifications_none,
                      color: Color(0xff8C8D8F), size: 28),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xff00B764),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ])),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => _showCreateCourseDialog(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                        color: Color(0xff152826),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xff00b764), width: 1)),
                    child: Text('Create New Course',
                        style: GoogleFonts.raleway(
                          color: const Color(0xff00b764),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            //  COURSE CARDS

            if (courses.isEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                child: Text(
                  'No courses yet. Create one to get started.',
                  style: GoogleFonts.raleway(
                    color: const Color(0xff8C8D8F),
                    fontSize: 14,
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: courses.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 32,
                      childAspectRatio: 1.0),
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    final studentCount =
                        (course['students'] as List?)?.length ?? 0;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseActivitiesT(course: course),
                          ),
                        );
                      },
                      child: CourseCardT(
                        imgIcon: Image.asset('assets/coursesIcon.png'),
                        courseName: course['title'] ?? '',
                        code: course['code'] ?? '',
                        stdNum: '$studentCount Students',
                      ),
                    );
                  },
                ),
              ),

            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}

void _showCreateCourseDialog(BuildContext context) {
  final titleController = TextEditingController();
  final emailController = TextEditingController();
  bool isSubmitting = false;

  showDialog(
    context: context,
    builder: (dialogContext) => StatefulBuilder(
      builder: (dialogContext, setState) => Dialog(
        backgroundColor: const Color(0xff191a1f),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xff00b764), width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Course Creation',
                      style: GoogleFonts.raleway(
                          color: Colors.white, fontSize: 16)),
                  GestureDetector(
                    onTap: () => Navigator.pop(dialogContext),
                    child:
                        const Icon(Icons.close, color: Colors.white, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'In order for you to create a course we need either the email from the school you are affiliated with or the professional email you would like to use',
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: titleController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Course Title',
                  hintStyle: GoogleFonts.poppins(
                      color: const Color(0xff8C8D8F), fontSize: 16),
                  filled: true,
                  fillColor: const Color(0xff191A1F),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xff303530), width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Work Email',
                  hintStyle: GoogleFonts.poppins(
                      color: const Color(0xff8C8D8F), fontSize: 16),
                  filled: true,
                  fillColor: const Color(0xff191A1F),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xff303530), width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 69,
                child: ElevatedButton.icon(
                  onPressed: isSubmitting
                      ? null
                      : () async {
                          if (titleController.text.trim().isEmpty ||
                              emailController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(dialogContext).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Course title and email are required'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          setState(() => isSubmitting = true);

                          final token = context.read<AuthProvider>().token!;
                          final result = await CoursesService.createCourse(
                            token: token,
                            title: titleController.text.trim(),
                            about: '',
                            code: titleController.text.trim(),
                          );

                          setState(() => isSubmitting = false);

                          if (result['success'] == true) {
                            if (dialogContext.mounted)
                              Navigator.pop(dialogContext);
                            context.read<CoursesProvider>().fetchCourses();
                          } else {
                            if (dialogContext.mounted) {
                              ScaffoldMessenger.of(dialogContext).showSnackBar(
                                SnackBar(
                                  content: Text(result['error'] ??
                                      'Failed to create course'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff00B764),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                  ),
                  icon: isSubmitting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                              color: Color(0xff191A1F), strokeWidth: 2),
                        )
                      : Image.asset('assets/coursesLogo.png',
                          width: 32,
                          height: 37,
                          color: const Color(0xff191A1F)),
                  label: Text(isSubmitting ? '' : 'Create Course',
                      style: GoogleFonts.raleway(
                        color: const Color(0xff191A1F),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
