import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../providers/navigation_provider.dart';
import '../../../utils/platform_info.dart';
import 'desktop_home_view.dart';
import 'mobile_navigation_bar.dart';
import 'navigation_pane.dart';
import 'openning_books_provider.dart';

// enum Screen { Home, Bookmark, Recent, Search }

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: CallbackShortcuts(
        bindings: {
          SingleActivator(LogicalKeyboardKey.keyW,
              meta: Platform.isMacOS ? true : false,
              control:
                  Platform.isWindows || Platform.isLinux ? true : false): () =>
              context.read<OpenningBooksProvider>().remove(),
        },
        child: Focus(
          autofocus: true,
          child: Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: SafeArea(
              child: Scaffold(
                  body: PlatformInfo.isDesktop || Mobile.isTablet(context)
                      ? const DesktopHomeView()
                      : const DetailNavigationPane(
                          navigationCount: 5,
                        ),
                  bottomNavigationBar:
                      !(PlatformInfo.isDesktop || Mobile.isTablet(context))
                          ? const MobileNavigationBar()
                          : null),
            ),
          ),
        ),
      ),
    );
  }
}
