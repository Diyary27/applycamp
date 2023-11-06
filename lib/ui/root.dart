import 'package:applycamp/ui/home/home_page.dart';
import 'package:applycamp/ui/profile/profile_page.dart';
import 'package:applycamp/ui/search/search_page.dart';
import 'package:applycamp/ui/support/support_page.dart';
import 'package:flutter/material.dart';

const int homeIndex = 0;
const int searchIndex = 1;
const int supportIndex = 2;
const int profileIndex = 3;

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _supportKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    searchIndex: _searchKey,
    supportIndex: _supportKey,
    profileIndex: _profileKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: selectedScreenIndex,
          children: [
            _navigator(_homeKey, homeIndex, const HomePage()),
            _navigator(_searchKey, searchIndex, const SearchPage()),
            _navigator(_supportKey, supportIndex, const SupportPage()),
            _navigator(_profileKey, profileIndex, const ProfilePage()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.support_rounded), label: 'support'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ],
          currentIndex: selectedScreenIndex,
          onTap: (selectedIndex) {
            setState(() {
              _history.remove(selectedScreenIndex);
              _history.add(selectedScreenIndex);
              selectedScreenIndex = selectedIndex;
            });
          },
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedScreenIndex != index, child: child)));
  }
}
