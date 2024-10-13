import 'package:flutter/material.dart';

class ItemContent extends StatefulWidget {
  const ItemContent({super.key});

  @override
  State<ItemContent> createState() => _ItemContentState();
}

class _ItemContentState extends State<ItemContent> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
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
          title: const Text('Items'),
          titleSpacing: 16,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton.icon(
                  onPressed: () {},
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
                    headingRowColor: MaterialStateProperty.all<Color>(
                        colorTheme.tertiaryContainer),
                  ),
                ]),
              ))
            ])));
  }
}
