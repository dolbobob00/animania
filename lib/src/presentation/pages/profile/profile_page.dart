import 'package:flutter/material.dart';
import '../../../configs/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Страна'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Казахстан'),
                Icon(Icons.chevron_right),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Изображение профиля'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.grey[600]),
                ),
                Icon(Icons.chevron_right),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Электронная почта'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('user@gmail.com'),
                Icon(Icons.chevron_right),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Номер телефона'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('+7755454533'),
                Icon(Icons.chevron_right),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Имя'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Bvge Norison'),
                Icon(Icons.chevron_right),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Удаление аккаунта'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          SwitchListTile(
            title: Text('Отправлять чеки на почту'),
            value: true,
            onChanged: (value) {},
          ),
          ListTile(
            title: Text('Очистить настройки автоматического перевода'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('Условия использования'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('Заявление о доступности'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Divider(height: 32),
          ListTile(
            title: Text(
              'Защита данных',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),
          ),
          ListTile(
            title: Text('Заявление о конфиденциальности'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
