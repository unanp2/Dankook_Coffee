
import '../database/DatabaseHelper.dart';
import '../menu/menu_model.dart';

class MenuService {
  final DatabaseHelper dbHelper;

  MenuService(this.dbHelper);

  Future<List<Menu>> fetchMenu() async {
    return await dbHelper.fetchMenus();
  }
}
