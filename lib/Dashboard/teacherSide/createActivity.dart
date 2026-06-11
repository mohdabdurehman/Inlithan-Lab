import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/appBar.dart';

class CreatecAtivityT extends StatelessWidget {
  const CreatecAtivityT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff191A1F),
        body: SafeArea(
            child: Column(
          children: [
            // APP BAR
            Appbar(
              title: 'Activities',
            ),

            const SizedBox(height: 138),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo img
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      child: Image.asset(
                        'assets/projectLogo.png',
                        width: 96,
                        height: 213,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // text
                  Text('You currently have no\n activities created',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        color: const Color(0xff8B8C8F),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),

                  const SizedBox(height: 64),

                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              const _ActivityCreationDialog());
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      backgroundColor: const Color(0xff00B764),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: Image.asset('assets/coursesIcon.png',
                        width: 32, height: 37, color: const Color(0xff191A1F)),
                    label: Text('Create Activity',
                        style: GoogleFonts.raleway(
                          color: const Color(0xff191A1F),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}

class _ActivityCreationDialog extends StatefulWidget {
  const _ActivityCreationDialog();

  @override
  State<_ActivityCreationDialog> createState() =>
      _ActivityCreationDialogState();
}

class _ActivityCreationDialogState extends State<_ActivityCreationDialog> {
  //  all defaults reset every time dialog opens
  String? _selectedCourse;
  String? _activityType;
  String? _timeBased;
  String? _questionType;
  String? _usePdf;
  bool _pdfUploaded = false;
  final TextEditingController _questionsController = TextEditingController();

  final List<String> _courses = [
    'Engineering Economics',
    'Mobile Computing',
    'Graduation Project',
  ];

  @override
  void dispose() {
    _questionsController.dispose();
    super.dispose();
  }

  Widget _radioOption(String label, String? groupValue, String value,
      void Function(String) onChanged) {
    final bool isSelected = groupValue == value;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xff00B764), width: 2),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: Color(0xff00B764),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 6),
          Text(label,
              style: GoogleFonts.raleway(
                color: isSelected
                    ? const Color(0xff00B764)
                    : const Color(0xff8C8D8F),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Text(text,
        style: GoogleFonts.raleway(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xff191A1F),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xff00B764), width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── HEADER ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Activity Creation',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.white, size: 20),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ── COURSE DROPDOWN fixed ──
            _label('Course:'),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xff303530)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCourse, //  uses state variable
                  dropdownColor: const Color(0xff191A1F),
                  style: GoogleFonts.raleway(color: Colors.white, fontSize: 14),
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Color(0xffffffff)),
                  items: _courses
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedCourse = value); //  updates state
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ── ACTIVITY TYPE ──
            _label('Activity Type:'),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _radioOption('Quiz', _activityType, 'Quiz',
                        (v) => setState(() => _activityType = v)),
                    const SizedBox(width: 24),
                    _radioOption('Assignment', _activityType, 'Assignment',
                        (v) => setState(() => _activityType = v)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                if (_activityType == null)
                  Text(
                    'Please select an activity type',
                    style: GoogleFonts.raleway(color: Colors.red),
                  ),
              ],
            ),

            const SizedBox(height: 16),

            // ── NUMBER OF QUESTIONS ──
            _label('Number of Questions:'),
            const SizedBox(height: 8),
            TextField(
              controller: _questionsController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Number of Questions',
                hintStyle: GoogleFonts.raleway(
                    color: const Color(0xff8C8D8F), fontSize: 14),
                filled: true,
                fillColor: const Color(0xff191A1F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xff303530)),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ── TIME BASED ──
            _label('Time Based:'),
            const SizedBox(height: 8),

            Row(
              children: [
                _radioOption('Yes', _timeBased, 'Yes',
                    (v) => setState(() => _timeBased = v)),
                const SizedBox(width: 24),
                _radioOption('No', _timeBased, 'No',
                    (v) => setState(() => _timeBased = v)),
              ],
            ),

            const SizedBox(height: 20),

            // ── QUESTION TYPE ──
            _label('Question Type:'),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _radioOption(
                    'Multiple Choice',
                    _questionType,
                    'Multiple Choice',
                    (v) => setState(() => _questionType = v)),
                const SizedBox(height: 10),
                _radioOption('Theory', _questionType, 'Theory',
                    (v) => setState(() => _questionType = v)),
                const SizedBox(height: 10),
                _radioOption('Mixed', _questionType, 'Mixed',
                    (v) => setState(() => _questionType = v)),
              ],
            ),

            const SizedBox(height: 20),

            // ── USE PDF ──
            _label('Use PDF:'),
            const SizedBox(height: 8),
            Row(
              children: [
                _radioOption(
                    'Yes', _usePdf, 'Yes', (v) => setState(() => _usePdf = v)),
                const SizedBox(width: 24),
                _radioOption(
                    'No', _usePdf, 'No', (v) => setState(() => _usePdf = v)),
              ],
            ),

            const SizedBox(height: 12),

            // ── PDF UPLOAD BOX ──
            GestureDetector(
              onTap: () => setState(() => _pdfUploaded = !_pdfUploaded),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff1E212A),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xff242727)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _pdfUploaded ? 'Uploaded' : 'PDF',
                      style: GoogleFonts.raleway(
                        color: _pdfUploaded
                            ? const Color(0xff00B764)
                            : const Color(0xff8C8D8F),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      _pdfUploaded
                          ? Icons.check_circle
                          : Icons.upload_file_outlined,
                      color: _pdfUploaded
                          ? const Color(0xff00B764)
                          : const Color(0xff8C8D8F),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── CREATE ACTIVITY BUTTON ──
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Activity Created!'),
                      backgroundColor: Color(0xff00B764),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00B764),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                icon: Image.asset('assets/coursesIcon.png',
                    width: 32, height: 37, color: const Color(0xff191A1F)),
                label: Text('Create Activity',
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
    );
  }
}
