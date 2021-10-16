import 'package:flutter/material.dart';
import 'package:park_mobil/UI/ApplicationBar/application_bar_view.dart';
import 'package:park_mobil/UI/Rezervasyon/rezervasyon_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Rezervasyon extends StatelessWidget {
  const Rezervasyon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RezervasyonViewModel>.reactive(
      onModelReady: (model)=>model.onModalReady(),
      viewModelBuilder: () => RezervasyonViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: const AppliactionBarView(),
          body: getScheduleViewCalendar(
              events: model.events, scheduleViewBuilder: scheduleViewBuilder)),
    );
  }


  /// returns the calendar widget based on the properties passed
  SfCalendar getScheduleViewCalendar(
      {DataSource? events, dynamic scheduleViewBuilder}) {
    return SfCalendar(
      showDatePickerButton: true,
      scheduleViewMonthHeaderBuilder: scheduleViewBuilder,
      view: CalendarView.schedule,
      dataSource: events,
    );
  }

  /// Returns the month name based on the month value passed from date.
  String _getMonthDate(int month) {
    if (month == 01) {
      return 'January';
    } else if (month == 02) {
      return 'February';
    } else if (month == 03) {
      return 'March';
    } else if (month == 04) {
      return 'April';
    } else if (month == 05) {
      return 'May';
    } else if (month == 06) {
      return 'June';
    } else if (month == 07) {
      return 'July';
    } else if (month == 08) {
      return 'August';
    } else if (month == 09) {
      return 'September';
    } else if (month == 10) {
      return 'October';
    } else if (month == 11) {
      return 'November';
    } else {
      return 'December';
    }
  }

  /// Returns the builder for schedule view.
  Widget scheduleViewBuilder(
      BuildContext buildContext, ScheduleViewMonthHeaderDetails details) {
    final String monthName = _getMonthDate(details.date.month);
    return Stack(
      children: <Widget>[
        Image(
            image: ExactAssetImage('images/' + monthName + '.png'),
            fit: BoxFit.cover,
            width: details.bounds.width,
            height: details.bounds.height),
        Positioned(
          left: 55,
          right: 0,
          top: 20,
          bottom: 0,
          child: Text(
            monthName + ' ' + details.date.year.toString(),
            style: const TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
