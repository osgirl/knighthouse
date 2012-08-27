define([
  'jquery',
  'underscore',
  'backbone',
  'text!templates/layout/navbar.html',
], function($, _, Backbone, navTemplate) {
  var NavBar = Backbone.View.extend({
    el: '.header-container',

    events: {
      'click a.signout': function() {
          this.model.signout();
        }
    },

    initialize: function() {
      this.model.on("change", this.render, this);
      this.template = _.template(navTemplate);
    },

    render: function() {
      console.log("Rendering Nav Bar");
      $(this.el).html(this.template(this.model.attributes));
    }
  });

  return NavBar;
});