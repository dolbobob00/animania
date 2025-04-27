import 'package:flutter/material.dart';
import '../../../configs/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> suggestions = [
    'Veg',
    'Non-Veg',
    'Fast Food',
    'Drinks',
    'Popular',
    'New',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search restaurants and food...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                });
              },
            ),
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Quick Filters',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.secondaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: FilterChip(
                          label: Text(suggestions[index]),
                          selected: _searchController.text == suggestions[index],
                          onSelected: (bool value) {
                            setState(() {
                              _searchController.text = suggestions[index];
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          if (_searchController.text.isEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.history),
                    title: Text('Recent search ${index + 1}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      setState(() {
                        _searchController.text = 'Recent search ${index + 1}';
                      });
                    },
                  );
                },
                childCount: 5,
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.restaurant),
                    title: Text('Search result ${index + 1}'),
                    subtitle: Text('Category • Rating ${4 + index % 2}'),
                    onTap: () {
                      // Handle search result tap
                    },
                  );
                },
                childCount: 10,
              ),
            ),
        ],
      ),
    );
  }
}
