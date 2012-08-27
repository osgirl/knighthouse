define([
  'jquery',
  'underscore',
  'backbone',
  'text!templates/layout/layout.html',
  'views/layout/navbar',
  'views/login/login',
  'views/login/reset-password',
  'views/misc/message'
], function($, _, Backbone, layoutTemplate, NavBar, LoginView, ResetPasswordView, Message) {
  var AppView = Backbone.View.extend({
    el: '.container',

    initialize: function (application, dispatcher) {
      this.application = application;
      this.dispatcher = dispatcher;
      this.dispatcher.on("login:show-login", this.login, this);
      this.dispatcher.on("login:show-reset", this.reset_password, this);
      this.dispatcher.on("login:user-signout", function() {
        this.message.warn("You have been signed out of the application", { subhead: "NOTICE:" });
      }, this);
    },

    hide_login_views: function() {
      this.loginView.hide();
      this.resetPasswordView.hide();
    },

    selectItem: function(item) {
      if (this.selectedItem) {
        this.selectedItem.removeClass("active");
      }

      this.selectedItem = $("#" + item);
      this.selectedItem.addClass("active");
    },

    login: function(opts) {
      this.resetPasswordView.hide();
      this.loginView.show(opts);
    },

    reset_password: function(opts) {
      this.loginView.hide();
      this.resetPasswordView.show(opts);
    },

    render: function () {
      $(this.el).html(layoutTemplate);
      
      this.loginView = new LoginView(this.dispatcher);
      this.loginView.render();
      this.resetPasswordView = new ResetPasswordView(this.dispatcher);
      this.resetPasswordView.render();
      this.message = new Message('.main-alert-area');

      this.navBar = new NavBar({ model: this.application });
      this.navBar.render();
    } 
  })

  return AppView;
});
