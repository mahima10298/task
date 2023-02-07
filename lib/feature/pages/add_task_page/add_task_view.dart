import 'package:assignment_1/core/router/routers.dart';
import 'package:assignment_1/feature/pages/add_task_page/add_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  void _selectTime(BuildContext context, controller) async {
    final TimeOfDay? selected = await showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: controller?.selectedTime ?? TimeOfDay.now(),
        confirmText: "Done");

    if (selected != null && selected != controller?.selectedTime) {
      DateTime parsedTime =
          DateFormat.jm().parse(selected.format(context).toString());
      String formattedTime = DateFormat('HH:mm').format(parsedTime);
      controller?.setTime(formattedTime);
    }
  }

  RelativeRect buttonMenuPosition(BuildContext context) {
    final RenderBox bar = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context)?.context.findRenderObject() as RenderBox;
    const Offset offset = Offset.zero;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.centerRight(offset)),
        bar.localToGlobal(bar.size.centerRight(offset), ancestor: overlay),
      ),
      offset & overlay.size,
    );
    return position;
  }

  _selectType(BuildContext context, controller) async {
    final String? dropDown =
        await showMenu(context: context, position: buttonMenuPosition(context),
            // initialValue: 'Business',
            items: [
          PopupMenuItem<String>(
            value: 'Business',
            child: Text('Business'),
          ),
          PopupMenuItem<String>(
            value: 'Personal',
            child: Text('Personal'),
          ),
        ]);

    if (dropDown != null && dropDown != controller?.selectedType) {
      controller?.setType(dropDown);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AddTaskController>(context);
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorPrimary,
        foregroundColor: colorPrimary,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: blueColor,
            size: 4.0.h,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.dehaze,
              color: blueColor,
              size: 4.0.h,
            ),
          )
        ],
        title: Text(
          ADDNEWTHING,
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 14.0.sp,
              textStyle: TextStyle(fontWeight: FontWeight.w500)),
        ),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<AddTaskController>(
          create: (_) => AddTaskController(),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 2.0.h),
                      height: 8.0.h,
                      width: 8.0.h,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(60)),
                      child: Icon(
                        Icons.notifications_active_outlined,
                        color: blueColor,
                        size: 6.0.h,
                      )),
                  Consumer<AddTaskController>(
                    builder: (context, controller, child) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0.w,
                        ),
                        child: Container(
                          width: 75.0.w,
                          child: TextField(
                            readOnly: true,
                            controller: controller.selectTypeController,
                            style: GoogleFonts.montserrat(color: Colors.white),
                            onTap: () => _selectType(context, controller),
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Icon(Icons.arrow_drop_down_sharp),
                              ),
                              hintText: " Select Type",
                              hintStyle:
                                  GoogleFonts.montserrat(color: Colors.white),
                              labelStyle:
                                  GoogleFonts.montserrat(color: Colors.white),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              // contentPadding:
                              //     EdgeInsets.symmetric(horizontal: 10)
                            ),
                            // : "${controller.timeController.value}",
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w, vertical: 2.0.h),
                    child: CustomTextfield(
                      controller: _controller.taskController,
                      focusNode: _controller.taskFocusNode,
                      width: 75.0.w,
                      keyboardType: TextInputType.emailAddress,
                      hintText: TASK,
                      hintTextcolor: Colors.white,
                      validation: (value) {
                        return Validators.validateEmptyField(value, context);
                      },
                    ),
                  ),
                  Consumer<AddTaskController>(
                    builder: (context, controller, child) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0.w,
                        ),
                        child: Container(
                          width: 75.0.w,
                          child: TextField(
                            readOnly: true,
                            controller: controller.timeController,
                            style: GoogleFonts.montserrat(color: Colors.white),
                            onTap: () => _selectTime(context, controller),
                            decoration: InputDecoration(
                                hintText: " Time",
                                hintStyle:
                                    GoogleFonts.montserrat(color: Colors.white),
                                labelStyle:
                                    GoogleFonts.montserrat(color: Colors.white),
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10)),
                            // : "${controller.timeController.value}",
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0.w, right: 10.0.w, top: 2.0.h),
                    child: CustomTextfield(
                      controller: _controller.placeController,
                      focusNode: _controller.placeFocusNode,
                      width: 75.0.w,
                      keyboardType: TextInputType.emailAddress,
                      hintText: PLACE,
                      hintTextcolor: Colors.white,
                      validation: (text) {
                        return Validators.validateEmptyField(text, context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w, vertical: 1.0.h),
                    child: CustomTextfield(
                      controller: _controller.notificationController,
                      focusNode: _controller.notificationFocusNode,
                      width: 75.0.w,
                      hintTextcolor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      hintText: NOTIFICATION,
                      validation: (value) {
                        return Validators.validateEmptyField(value, context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0.h),
                    child: CustomElevatedButton(
                      btnText: ADDYOURTHING,
                      btnTxtcolor: Colors.white,
                      btnTextWeight: FontWeight.w500,
                      btnTextSize: 14,
                      btnFunction: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, Routes.HOMEPAGE);
                        }
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
