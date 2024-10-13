import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../models/user.dart';

class UserContent extends StatefulWidget {
  const UserContent({super.key});

  @override
  State<UserContent> createState() => _UserContentState();
}

class _UserContentState extends State<UserContent> {
  late final ScrollController _scrollController;
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<User> _users = [];
  String _searchQuery = '';

  Future<void> _refreshUsers() async {
    final users = await _dbHelper.getUsers(_searchQuery);
    setState(() => _users = users);
  }

  void _showAddUserDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController roleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: roleController,
                decoration: const InputDecoration(labelText: 'Role')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await _dbHelper.insertUser(User(
                name: nameController.text,
                role: roleController.text,
              ));
              Navigator.pop(context);
              _refreshUsers();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _refreshUsers();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final titleFontSize = Theme.of(context).textTheme.titleLarge!.fontSize;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          titleSpacing: 16,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton.icon(
                  onPressed: _showAddUserDialog,
                  label: Text('New', style: TextStyle(fontSize: titleFontSize)),
                  icon: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: colorTheme.primary,
                      textStyle: TextStyle(fontSize: titleFontSize),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
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
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      hintText: 'Search here',
                      leading: const Icon(Icons.search),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
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
                                  BorderRadius.all(Radius.circular(8.0))),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16.0)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                  child: Scrollbar(
                controller: _scrollController,
                interactive: true,
                trackVisibility: true,
                thumbVisibility: true,
                child: ListView(controller: _scrollController, children: [
                  DataTable(
                    columns: _createColumns(),
                    rows: _createRows(),
                    headingRowColor: WidgetStateProperty.all<Color>(
                        colorTheme.tertiaryContainer),
                  ),
                ]),
              ))
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
    ])
  ];
}
