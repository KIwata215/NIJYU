import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateOfBirth extends StatefulWidget {
  final double width;
  final double height;
  final String label;
  final TextEditingController controller;

  const DateOfBirth({
    Key? key,
    required this.height,
    required this.width,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  int _selectedYear = DateTime.now().year - 20;
  int _selectedMonth = DateTime.now().month;
  int _selectedDay = DateTime.now().day;

  List<int> _years = List<int>.generate(
    DateTime.now().year - 1940 - 20 + 1,
    (index) => 1940 + index,
  );
  List<int> _months = List<int>.generate(12, (index) => index + 1);
  List<int> _days = List<int>.generate(31, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 6.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              _showModalPicker(context);
            },
            controller: widget.controller,
          ),
        ),
      ],
    );
  }

  void _showModalPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                        initialItem: _years.indexOf(_selectedYear)),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedYear = _years[index];
                      });
                    },
                    children: _years.map((year) => Text('$year年')).toList(),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                        initialItem: _months.indexOf(_selectedMonth)),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedMonth = _months[index];
                      });
                    },
                    children: _months.map((month) => Text('$month月')).toList(),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                        initialItem: _days.indexOf(_selectedDay)),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedDay = _days[index];
                      });
                    },
                    children: _days.map((day) => Text('$day日')).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      widget.controller.text = '$_selectedYear年$_selectedMonth月$_selectedDay日';
    });
  }
}
