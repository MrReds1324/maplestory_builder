// All of this is so that we can create our own extended change notifier proxies that include more values than just 6... Who knows if this is a good idea
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class _ChangeNotifierProvider<T extends ChangeNotifier?>
    extends ListenableProvider<T> {
  /// Creates a [ChangeNotifier] using `create` and automatically
  /// disposes it when [ChangeNotifierProvider] is removed from the widget tree.
  ///
  /// `create` must not be `null`.
  _ChangeNotifierProvider({
    Key? key,
    required Create<T> create,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : super(
          key: key,
          create: create,
          dispose: _dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  /// Provides an existing [ChangeNotifier].
  // ignore: unused_element
  _ChangeNotifierProvider.value({
    Key? key,
    required T value,
    TransitionBuilder? builder,
    Widget? child,
  }) : super.value(
          key: key,
          builder: builder,
          value: value,
          child: child,
        );

  static void _dispose(BuildContext context, ChangeNotifier? notifier) {
    notifier?.dispose();
  }
}

// ignore: public_member_api_docs
typedef ProxyProviderBuilder12<T, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  T4 value4,
  T5 value5,
  T6 value6,
  T7 value7,
  T8 value8,
  T9 value9,
  T10 value10,
  T11 value11,
  T12 value12,
  R? previous,
);

/// {@macro provider.listenableproxyprovider}
class _ListenableProxyProvider12<T, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, R extends Listenable?>
    extends ListenableProxyProvider0<R> {
  /// Initializes [key] for subclasses.
  _ListenableProxyProvider12({
    Key? key,
    Create<R>? create,
    required ProxyProviderBuilder12<T, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, R> update,
    Dispose<R>? dispose,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : super(
          key: key,
          create: create,
          lazy: lazy,
          builder: builder,
          update: (context, previous) => update(
            context,
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            previous,
          ),
          dispose: dispose,
          child: child,
        );
}

/// {@macro provider.changenotifierproxyprovider}
class ChangeNotifierProxyProvider12<T, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, R extends ChangeNotifier?>
    extends _ListenableProxyProvider12<T, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, R> {
  /// Initializes [key] for subclasses.
  ChangeNotifierProxyProvider12({
    Key? key,
    required Create<R> create,
    required ProxyProviderBuilder12<T, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, R> update,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : super(
          key: key,
          create: create,
          update: update,
          dispose: _ChangeNotifierProvider._dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}