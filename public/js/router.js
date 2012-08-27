// Filename: router.js
define([
  'jquery',
  'underscore',
  'backbone',
  'views/home/home',
  'views/orders/orders'
], function ($, _, Backbone, HomeView, OrdersView) {
  var AppRouter = Backbone.Router.extend({
    routes: {
      // Pages
      "home": "home",
      "orders": "orders",
      "deliveries": "deliveries",
      "receiving": "receiving",
      "administration": "administration",
    
      // Default - catch all
      '*actions': 'defaultAction'
    },

    initialize: function(appView, dispatcher, application) {
      this.appView = appView;
      this.dispatcher = dispatcher;
      this.application = application;
      this.orderView = new OrdersView(this.dispatcher);

      this.dispatcher.on("login:user-authenticated", this.signin, this);
      this.dispatcher.on("login:user-signout", function() {
        console.log("User signout: router");
        this.home();
      }, this);
    },

    home: function () {
      this.authenticate();
      this.appView.selectItem("home");
      var homeView = new HomeView(this.dispatcher);
      homeView.render();
    },

    orders: function()
    {
        this.authenticate();
        this.appView.selectItem("orders");
        this.orderView.render();
    },

    deliveries: function() {
      this.authenticate();
      this.appView.selectItem("deliveries");
    },

    receiving: function() {
      this.authenticate();
      this.appView.selectItem("receiving");
    },

    administration: function() {
      this.authenticate();
      this.appView.selectItem("administration");
    },

    defaultAction: function(actions){
      // We have no matching route, lets display the dashboard 
      
      this.home();
    },

    authenticate: function() {
      console.log("Calling authenticate");
      if (!this.application.get("authenticated"))
      {
        console.log("Not authenticated");
        this.appView.login();
      }
    },

    signin: function() {
      // update menu items
        // update pull out on menu
        ctx = this;
        this.application.update_user_settings(function() {
          // TODO: continue with previous action
          ctx.appView.hide_login_views();
          ctx.appView.message.success("You have been logged in successfully!", { subhead: "Success!" });
        });
        
        
    }
  });

  return {
    initialize: function(appView, dispatcher, application) {
      var app_router = new AppRouter(appView, dispatcher, application);
      Backbone.history.start();
    }
  };
});
