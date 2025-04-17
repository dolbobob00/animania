import 'package:flutter/material.dart';
import '../../../data/models/country_model.dart';

class CountrySelector extends StatelessWidget {
  const CountrySelector({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
  });

  final CountryModel? selectedCountry;
  final Function(CountryModel) onCountrySelected;

  // Временный список стран
  static const List<CountryModel> countries = [
    CountryModel(name: 'Russia', code: 'RU', flag: '🇷🇺'),
    CountryModel(name: 'Uzbekistan', code: 'UZ', flag: 'uz'),
    CountryModel(name: 'United States', code: 'US', flag: '🇺🇸'),
    CountryModel(name: 'United Kingdom', code: 'GB', flag: '🇬🇧'),
    CountryModel(name: 'Germany', code: 'DE', flag: '🇩🇪'),
  ];

  void _showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Select Country',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    leading: Text(
                      country.flag,
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(country.name),
                    onTap: () {
                      onCountrySelected(country);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => _showCountryPicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.public, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Text(
              selectedCountry?.name ?? 'Select Country',
              style: theme.textTheme.bodyLarge,
            ),
            if (selectedCountry != null) ...[
              const SizedBox(width: 8),
              Text(
                selectedCountry!.flag,
                style: const TextStyle(fontSize: 20),
              ),
            ],
            const Spacer(),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
