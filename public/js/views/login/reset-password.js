define([
	'jquery', 
	'backbone', 
	'underscore', 
	'text!templates/login/reset-password.html',
	'views/misc/message'
], function($, Backbone, _, resetTemplate, Message) {
	var ResetView = Backbone.View.extend({
		events: {
			'click .password-button': "reset_password",
			'click .login-button': "login"
		},

		initialize: function(dispatcher) {
			this.dispatcher = dispatcher;
		},

		reset_password: function() {
			var email = this.$("#email").val();

			if (email) {
				//this.message("Password Reset for: " + email, "Success!", "success");
				this.dispatcher.trigger("login:show-login", { passwordReset: email });
			} else {
				this.message.error("You must enter an email address!", {subhead: "Uh oh!"});
				return false;
			}
			
			// attempt reset
			// display failure if not reset
			// redirect to login with success if reset
		},

		login: function() {
			this.dispatcher.trigger("login:show-login");
		},

		show: function(opts) {

			this.mwin.modal('show');
		},

		hide: function() {
			this.mwin.modal('hide');
		},

		render: function() {
			this.$el.html(resetTemplate);
			$("body .auxiliary").append(this.el);
			this.message = new Message('.alert-area');
			this.mwin = this.$(".modal");
			this.mwin.modal({
				backdrop: "static",
				keyboard: false,
				show: false
			});
		}
	});

	return ResetView;
});