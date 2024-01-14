import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tea_time/view/base/base_widget.dart';
import 'package:tea_time/viewModel/home/diary_calendar_view_model.dart';

class DiaryCalendar extends BaseWidget<DiaryCalendarViewModel> {
  const DiaryCalendar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TableCalendar(
            locale: 'ko_KR',
            firstDay: DateTime.now().subtract(const Duration(days: 365 * 10 + 2)),
            lastDay: DateTime.now().add(const Duration(days: 365 * 10 + 2)),
            currentDay: DateTime.now(),
            focusedDay: viewModel.focusedDate,
            calendarFormat: viewModel.calendarFormat,
            daysOfWeekHeight: 30,
              rowHeight: 50,
            sixWeekMonthsEnforced: true,
            headerStyle: const HeaderStyle(
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
              ),

              selectedDayPredicate: (day) {
                return isSameDay(viewModel.selectedDate, day);
              },
            ),
          ),
        );
  }
}