define([
  'jquery',
  'underscore',
  'backbone',
  'text!templates/messages/message.html',
], function($, _, Backbone, messageTpl) {
  var Message = Backbone.View.extend({

    initialize: function(parent_element) {
       this.setElement(parent_element);
       this.template = _.template(messageTpl);
    },

    success: function(msg, opts) {
      this.display(msg, "success", opts);
    },

    error: function(msg, opts) {
      this.display(msg, "error", opts);
    },

    warn: function(msg, opts) {
      this.display(msg, "warn", opts);
    },

    info: function(msg, opts) {
      this.display(msg, "info", opts);
    },

    display: function(msg, type, opts) {
        this.$el.html(this.template(messageTpl, {
          is_block: (opts && opts.is_block) || false,
          title: (opts && opts.title) || false,
          subhead: (opts && opts.subhead) || false,
          message: msg,
          type: type,
          show_close_button: (opts && opts.show_close_button) || false
        }));
    },

    render: function() {
      
    }
  });

  return Message;
});