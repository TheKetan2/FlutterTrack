define(['dart_sdk', 'packages/flutter_web/material', 'packages/flutter_web/animation'], function(dart_sdk, material, animation) {
  'use strict';
  const core = dart_sdk.core;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const src__material__app = material.src__material__app;
  const src__material__theme_data = material.src__material__theme_data;
  const src__material__colors = material.src__material__colors;
  const src__material__scaffold = material.src__material__scaffold;
  const src__material__app_bar = material.src__material__app_bar;
  const src__material__list_tile = material.src__material__list_tile;
  const src__material__drawer = material.src__material__drawer;
  const src__material__floating_action_button = material.src__material__floating_action_button;
  const src__material__icons = material.src__material__icons;
  const src__widgets__widget_inspector = animation.src__widgets__widget_inspector;
  const src__widgets__framework = animation.src__widgets__framework;
  const src__widgets__text = animation.src__widgets__text;
  const src__widgets__scroll_view = animation.src__widgets__scroll_view;
  const src__widgets__icon = animation.src__widgets__icon;
  const src__widgets__binding = animation.src__widgets__binding;
  const main = Object.create(dart.library);
  let BuildContextAndintToListTile = () => (BuildContextAndintToListTile = dart.constFn(dart.fnType(src__material__list_tile.ListTile, [src__widgets__framework.BuildContext, core.int])))();
  let VoidToNull = () => (VoidToNull = dart.constFn(dart.fnType(core.Null, [])))();
  let const$;
  let const$0;
  let const$1;
  let const$2;
  let const$3;
  let const$4;
  let const$5;
  main.MyApp = class MyApp extends src__widgets__framework.StatelessWidget {
    build(context) {
      return new src__material__app.MaterialApp.new({debugShowCheckedModeBanner: false, home: new main.HomePage.new({$creationLocationd_0dea112b090073317d4: const$0 || (const$0 = dart.const(new src__widgets__widget_inspector._Location.new({line: 14, column: 13, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$ || (const$ = dart.constList([], src__widgets__widget_inspector._Location))})))}), theme: src__material__theme_data.ThemeData.new({primarySwatch: src__material__colors.Colors.red}), $creationLocationd_0dea112b090073317d4: const$5 || (const$5 = dart.const(new src__widgets__widget_inspector._Location.new({line: 12, column: 12, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$4 || (const$4 = dart.constList([const$1 || (const$1 = dart.const(new src__widgets__widget_inspector._Location.new({line: 13, column: 7, name: "debugShowCheckedModeBanner"}))), const$2 || (const$2 = dart.const(new src__widgets__widget_inspector._Location.new({line: 14, column: 7, name: "home"}))), const$3 || (const$3 = dart.const(new src__widgets__widget_inspector._Location.new({line: 15, column: 7, name: "theme"})))], src__widgets__widget_inspector._Location))})))});
    }
  };
  (main.MyApp.new = function(opts) {
    let key = opts && 'key' in opts ? opts.key : null;
    let $creationLocationd_0dea112b090073317d4 = opts && '$creationLocationd_0dea112b090073317d4' in opts ? opts.$creationLocationd_0dea112b090073317d4 : null;
    main.MyApp.__proto__.new.call(this, {key: key, $creationLocationd_0dea112b090073317d4: $creationLocationd_0dea112b090073317d4});
    ;
  }).prototype = main.MyApp.prototype;
  dart.addTypeTests(main.MyApp);
  dart.setMethodSignature(main.MyApp, () => ({
    __proto__: dart.getMethods(main.MyApp.__proto__),
    build: dart.fnType(src__widgets__framework.Widget, [src__widgets__framework.BuildContext])
  }));
  let const$6;
  let const$7;
  let const$8;
  let const$9;
  let const$10;
  let const$11;
  let const$12;
  let const$13;
  let const$14;
  let const$15;
  let const$16;
  let const$17;
  let const$18;
  let const$19;
  let const$20;
  let const$21;
  let const$22;
  let const$23;
  let const$24;
  let const$25;
  let const$26;
  let const$27;
  let const$28;
  let const$29;
  let const$30;
  let const$31;
  let const$32;
  let const$33;
  let const$34;
  let const$35;
  let const$36;
  main.HomePage = class HomePage extends src__widgets__framework.StatelessWidget {
    build(context) {
      return new src__material__scaffold.Scaffold.new({appBar: new src__material__app_bar.AppBar.new({title: new src__widgets__text.Text.new("Flutter for web", {$creationLocationd_0dea112b090073317d4: const$8 || (const$8 = dart.const(new src__widgets__widget_inspector._Location.new({line: 29, column: 16, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$7 || (const$7 = dart.constList([const$6 || (const$6 = dart.const(new src__widgets__widget_inspector._Location.new({line: 29, column: 21, name: "data"})))], src__widgets__widget_inspector._Location))})))}), $creationLocationd_0dea112b090073317d4: const$11 || (const$11 = dart.const(new src__widgets__widget_inspector._Location.new({line: 28, column: 15, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$10 || (const$10 = dart.constList([const$9 || (const$9 = dart.const(new src__widgets__widget_inspector._Location.new({line: 29, column: 9, name: "title"})))], src__widgets__widget_inspector._Location))})))}), body: new src__widgets__scroll_view.ListView.builder({itemCount: 50, itemBuilder: dart.fn((context, index) => new src__material__list_tile.ListTile.new({title: new src__widgets__text.Text.new("Item " + dart.str(index), {$creationLocationd_0dea112b090073317d4: const$14 || (const$14 = dart.const(new src__widgets__widget_inspector._Location.new({line: 35, column: 20, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$13 || (const$13 = dart.constList([const$12 || (const$12 = dart.const(new src__widgets__widget_inspector._Location.new({line: 35, column: 38, name: "data"})))], src__widgets__widget_inspector._Location))})))}), $creationLocationd_0dea112b090073317d4: const$17 || (const$17 = dart.const(new src__widgets__widget_inspector._Location.new({line: 34, column: 18, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$16 || (const$16 = dart.constList([const$15 || (const$15 = dart.const(new src__widgets__widget_inspector._Location.new({line: 35, column: 13, name: "title"})))], src__widgets__widget_inspector._Location))})))}), BuildContextAndintToListTile()), $creationLocationd_0dea112b090073317d4: const$21 || (const$21 = dart.const(new src__widgets__widget_inspector._Location.new({line: 31, column: 22, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$20 || (const$20 = dart.constList([const$18 || (const$18 = dart.const(new src__widgets__widget_inspector._Location.new({line: 32, column: 9, name: "itemCount"}))), const$19 || (const$19 = dart.const(new src__widgets__widget_inspector._Location.new({line: 33, column: 9, name: "itemBuilder"})))], src__widgets__widget_inspector._Location))})))}), drawer: new src__material__drawer.Drawer.new({$creationLocationd_0dea112b090073317d4: const$23 || (const$23 = dart.const(new src__widgets__widget_inspector._Location.new({line: 39, column: 15, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$22 || (const$22 = dart.constList([], src__widgets__widget_inspector._Location))})))}), floatingActionButton: new src__material__floating_action_button.FloatingActionButton.new({child: new src__widgets__icon.Icon.new(src__material__icons.Icons.add, {$creationLocationd_0dea112b090073317d4: const$26 || (const$26 = dart.const(new src__widgets__widget_inspector._Location.new({line: 41, column: 16, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$25 || (const$25 = dart.constList([const$24 || (const$24 = dart.const(new src__widgets__widget_inspector._Location.new({line: 41, column: 27, name: "icon"})))], src__widgets__widget_inspector._Location))})))}), onPressed: dart.fn(() => {
          }, VoidToNull()), $creationLocationd_0dea112b090073317d4: const$30 || (const$30 = dart.const(new src__widgets__widget_inspector._Location.new({line: 40, column: 29, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$29 || (const$29 = dart.constList([const$27 || (const$27 = dart.const(new src__widgets__widget_inspector._Location.new({line: 41, column: 9, name: "child"}))), const$28 || (const$28 = dart.const(new src__widgets__widget_inspector._Location.new({line: 42, column: 9, name: "onPressed"})))], src__widgets__widget_inspector._Location))})))}), $creationLocationd_0dea112b090073317d4: const$36 || (const$36 = dart.const(new src__widgets__widget_inspector._Location.new({line: 27, column: 12, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$35 || (const$35 = dart.constList([const$31 || (const$31 = dart.const(new src__widgets__widget_inspector._Location.new({line: 28, column: 7, name: "appBar"}))), const$32 || (const$32 = dart.const(new src__widgets__widget_inspector._Location.new({line: 31, column: 7, name: "body"}))), const$33 || (const$33 = dart.const(new src__widgets__widget_inspector._Location.new({line: 39, column: 7, name: "drawer"}))), const$34 || (const$34 = dart.const(new src__widgets__widget_inspector._Location.new({line: 40, column: 7, name: "floatingActionButton"})))], src__widgets__widget_inspector._Location))})))});
    }
  };
  (main.HomePage.new = function(opts) {
    let key = opts && 'key' in opts ? opts.key : null;
    let $creationLocationd_0dea112b090073317d4 = opts && '$creationLocationd_0dea112b090073317d4' in opts ? opts.$creationLocationd_0dea112b090073317d4 : null;
    main.HomePage.__proto__.new.call(this, {key: key, $creationLocationd_0dea112b090073317d4: $creationLocationd_0dea112b090073317d4});
    ;
  }).prototype = main.HomePage.prototype;
  dart.addTypeTests(main.HomePage);
  dart.setMethodSignature(main.HomePage, () => ({
    __proto__: dart.getMethods(main.HomePage.__proto__),
    build: dart.fnType(src__widgets__framework.Widget, [src__widgets__framework.BuildContext])
  }));
  let const$37;
  let const$38;
  main.main = function() {
    src__widgets__binding.runApp(new main.MyApp.new({$creationLocationd_0dea112b090073317d4: const$38 || (const$38 = dart.const(new src__widgets__widget_inspector._Location.new({line: 4, column: 10, file: "org-dartlang-app:///packages/flutter_for_web/main.dart", parameterLocations: const$37 || (const$37 = dart.constList([], src__widgets__widget_inspector._Location))})))}));
  };
  dart.trackLibraries("packages/flutter_for_web/main", {
    "package:flutter_for_web/main.dart": main
  }, '{"version":3,"sourceRoot":"","sources":["org-dartlang-app:///packages/flutter_for_web/main.dart"],"names":[],"mappings":";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;UAU4B;AACxB,YAAO,qEACuB,aACtB,4VACC,wDACiB;IAG5B;;;QAXiB;;AAAQ,8CAAW,GAAG;;EAAC;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;UAkBd;AACxB,YAAO,mDACG,8CACC,gCAAK,g5BAEC,2DACF,iBACE,SAAc,SAAa,UAC/B,kDACE,gCAAK,AAAa,mBAAN,KAAK,k/CAItB,gYACc,2EACb,gCAAW,2eACP;;IAGjB;;;QAtBoB;;AAAQ,iDAAW,GAAG;;EAAC;;;;;;;;;IAnB3C,6BAAO;EACT","file":"main.ddc.js"}');
  // Exports:
  return {
    main: main
  };
});

//# sourceMappingURL=main.ddc.js.map
