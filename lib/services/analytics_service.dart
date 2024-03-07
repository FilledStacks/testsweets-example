import 'package:flutter/material.dart';
import 'package:testsweets/testsweets.dart';

class AnalyticsService {
  void logEvent({
    required String name,
    required Map<String, dynamic> properties,
  }) {
    // Here you would have your normal analytics call, followed by a TestSweets call
    TestSweets.captureEvent(name: name, properties: properties);
  }
}

class AnalyticsNavigatorObserver extends RouteObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _sendScreenView(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _sendScreenView(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _sendScreenView(previousRoute);
  }

  void _sendScreenView(Route<dynamic>? route) {
    TestSweets.captureEvent(
      name: 'Screen Navigation',
      properties: {'path': route?.settings.name ?? 'noView'},
    );
  }
}
