define([
  'underscore',
  'jquery',
  'backbone',
  'libs/jquery/jquery.cookie'
], function(_, $, Backbone) {
  var applicationModel = Backbone.Model.extend({
    defaults: {
      authenticated: false,
      username: "",
      navitems: []
    },

    initialize: function(dispatcher) {
      this.dispatcher = dispatcher;

      var jsonCfg = $.cookie("JSESSIONID");
      if (jsonCfg) {
        this.update_user_settings(null, true);
      }
    },

    signout: function() {
      $.cookie("JSESSIONID", null);
      this.clear();
      console.log("Firing User Signout");
      this.dispatcher.trigger("login:user-signout", {});
    },

    update_user_settings: function(callback, sync) {
      ctx = this;

      var sxhr = $.ajax({
          type: 'GET',
          url: 'settings',
          dataType: 'json',
          async: !sync,
          success: function(data, status, xhr) {
              user_cfg = data;
              user_cfg.authenticated = true;
              ctx.set(user_cfg);

              if (callback)
                callback.call();
          }
        });
    }

  });

  return applicationModel;

});
