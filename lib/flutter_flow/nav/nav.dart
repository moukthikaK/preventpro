import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => LandingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => LandingWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'Squats',
          path: '/squats',
          builder: (context, params) => SquatsWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'Push-ups',
          path: '/pushUps',
          builder: (context, params) => PushUpsWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'pullupschinups',
          path: '/pullupschinups',
          builder: (context, params) => PullupschinupsWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'crunches',
          path: '/crunches',
          builder: (context, params) => CrunchesWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'Lunges',
          path: '/lunges',
          builder: (context, params) => LungesWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'Running',
          path: '/running',
          builder: (context, params) => RunningWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'Burpees',
          path: '/burpees',
          builder: (context, params) => BurpeesWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'cycling',
          path: '/cycling',
          builder: (context, params) => CyclingWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'swimming',
          path: '/swimming',
          builder: (context, params) => SwimmingWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'hiit',
          path: '/hiit',
          builder: (context, params) => HiitWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'bicepcurls',
          path: '/bicepcurls',
          builder: (context, params) => BicepcurlsWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'tricepdips',
          path: '/tricepdips',
          builder: (context, params) => TricepdipsWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'deadlifts',
          path: '/deadlifts',
          builder: (context, params) => DeadliftsWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'benchpress',
          path: '/benchpress',
          builder: (context, params) => BenchpressWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'shoulderpress',
          path: '/shoulderpress',
          builder: (context, params) => ShoulderpressWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'dumbellrows',
          path: '/dumbellrows',
          builder: (context, params) => DumbellrowsWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'legpress',
          path: '/legpress',
          builder: (context, params) => LegpressWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'barbellsquats',
          path: '/barbellsquats',
          builder: (context, params) => BarbellsquatsWidget(),
        ),
        FFRoute(
          name: 'latpulldowns',
          path: '/latpulldowns',
          builder: (context, params) => LatpulldownsWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'tricepextensions',
          path: '/tricepextensions',
          builder: (context, params) => TricepextensionsWidget(
            artPiece: params.getParam(
              'artPiece',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'landing',
          path: '/landing',
          builder: (context, params) => LandingWidget(),
        ),
        FFRoute(
          name: 'welcome',
          path: '/welcome',
          builder: (context, params) => WelcomeWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
