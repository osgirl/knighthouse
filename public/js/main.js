// Require.js allows us to configure shortcut alias
// Their usage will become more apparent futher along in the tutorial.
require.config({
  paths: {
    // Major libraries
    jquery: 'libs/jquery/jquery-min',
    underscore: 'libs/underscore/underscore-min', // https://github.com/amdjs
    backbone: 'libs/backbone/backbone-min', // https://github.com/amdjs
    bootstrap: 'libs/bootstrap/bootstrap.min',
    //json2: 'libs/json2/json2',
    less: 'libs/less/less-1.3.0.min',

    // Require.js plugins
    text: 'libs/require/text',
    order: 'libs/require/order',
    cs: 'libs/require/cs',

    // Just a short cut so we can put our html outside the js dir
    // When you have HTML/CSS designers this aids in keeping them out of the js directory
    templates: '../templates'
  }

});

require(['order!jquery', 
		 'order!less', 
		 'order!bootstrap', 
     'order!libs/jquery/jquery.cookie',
     'order!libs/jquery/jquery.json-2.3.min'
		 ], function(less, bootstrap) {
      require([]);
});

// Let's kick off the application

require([
  'underscore',
  'backbone',
  'views/app',
  'router',
  'models/application'
], function(_, Backbone, AppView, Router, ApplicationModel){
  var dispatcher = _.clone(Backbone.Events);
  dispatcher.on("all", function(eventname) {
    console.log(eventname + " event fired");
  });
  var application = new ApplicationModel(dispatcher);
  var appView = new AppView(application, dispatcher);
  window.app = appView;
  appView.render();
  Router.initialize(appView, dispatcher, application);
});