import 'package:flutter/material.dart';

class ModalSelector extends StatelessWidget {
  final String title;
  final List<String> data;
  final String? selectedValue;
  final Function(String) onSelect;

  const ModalSelector({
    super.key,
    required this.title,
    required this.data,
    this.selectedValue,
    required this.onSelect,
  });

  static Future<void> show({
    required BuildContext context,
    required String title,
    required List<String> data,
    String? selectedValue,
    required Function(String) onSelect,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ModalSelector(
        title: title,
        data: data,
        selectedValue: selectedValue,
        onSelect: onSelect,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: data.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = data[index];
                final isSelected = selectedValue == item;

                return ListTile(
                  title: Text(
                    item,
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check, color: theme.colorScheme.primary)
                      : null,
                  tileColor: isSelected
                      ? theme.colorScheme.primary.withOpacity(0.1)
                      : null,
                  onTap: () {
                    onSelect(item);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
