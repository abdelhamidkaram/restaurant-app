import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'buttons/main_button.dart';

class AddNote extends StatefulWidget {
  final TextEditingController noteController;

  final IconData? icon;

  const AddNote({super.key, required this.noteController, this.icon});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    var noteController = widget.noteController;
    return TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: Container(
                      width: double.infinity,
                      height: 270.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: noteController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: 'ADD NOTE HERE',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                            SizedBox(
                              width: 120.w,
                              child: MainButton(
                                  text: 'Save',
                                  onTap: () {
                                    Navigator.pop(context);
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        child: widget.icon != null ? Row(
          children: [
             Icon(
              widget.icon,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: 5.w,
            ),
            const Text(
              'Add note',
            ),
          ],
        ) : const Text(
          'Add note',
        ));
  }
}
