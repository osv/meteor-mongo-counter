Package.describe({
  summary: "Atomic counters stored in MongoDB",
  version: "0.3.6",
  git: "https://github.com/osv/meteor-mongo-counter.git",
  name: "osv:mongo-counter"
});

Package.onUse(function (api) {
  api.versionsFrom("METEOR@1.6.1");
  api.use(['coffeescript', 'mongo-livedata','underscore'], 'server');
  api.addFiles('counter.coffee', 'server');
  if (api.export) {
    api.export('incrementCounter', 'server');
    api.export('decrementCounter', 'server');
    api.export('setCounter', 'server');
    api.export('deleteCounters', 'server', {testOnly: true});
  }
});

Package.onTest(function(api) {
  api.use('coffeescript');
  api.use('tinytest');
  api.use('osv:mongo-counter');
  api.addFiles('counter-tests.coffee', 'server');
});
