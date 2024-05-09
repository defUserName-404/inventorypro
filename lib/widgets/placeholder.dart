import 'package:flutter/material.dart';

class ContentPlaceholder extends StatelessWidget {
  const ContentPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final titleFontSize = Theme.of(context).textTheme.titleLarge!.fontSize;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
          titleSpacing: 32,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: TextButton.icon(
                  onPressed: () {},
                  label: Text('New', style: TextStyle(fontSize: titleFontSize)),
                  icon: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: colorTheme.onSurface,
                      textStyle: TextStyle(fontSize: titleFontSize),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16))),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                color: colorTheme.secondaryContainer,
                height: 2.0,
              )),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      hintText: 'Search here',
                      leading: const Icon(Icons.search),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)))),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  SizedBox(
                    height: 56.0,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down),
                      label: Text(
                        'Filter',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: colorTheme.onSurface),
                      ),
                      style: TextButton.styleFrom(
                          elevation: 6.0,
                          backgroundColor: colorTheme.surface,
                          foregroundColor: colorTheme.onSurface,
                          shadowColor: colorTheme.shadow,
                          surfaceTintColor: colorTheme.surfaceTint,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16.0)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Expanded(
                  child: ListView(children: [
                DataTable(
                  columns: _createColumns(),
                  rows: _createRows(),
                  headingRowColor: MaterialStateProperty.all<Color>(
                      colorTheme.tertiaryContainer),
                ),
              ]))
            ])));
  }
}

List<DataColumn> _createColumns() {
  return [
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('Book')),
    DataColumn(label: Text('Author'))
  ];
}

List<DataRow> _createRows() {
  return [
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#101')),
      DataCell(Text('Dart Internals')),
      DataCell(Text('Alex Wick'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John'))
    ]),
  ];
}
