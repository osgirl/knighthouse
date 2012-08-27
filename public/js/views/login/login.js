define([
	'jquery', 
	'backbone', 
	'underscore', 
	'text!templates/login/login.html',
	'views/misc/message'
], function($, Backbone, _, loginTemplate, Message) {
	var LoginView = Backbone.View.extend({
		events: {
			'click .login-button': "login",
			'click .password-button': "reset_password"
		},

		initialize: function(dispatcher) {
			this.dispatcher = dispatcher;
		},

		login: function() {
			if (credentials = this.validate()) {
				ctx = this;

				var xhr = $.post('users/sign_in', credentials, function(data, status, xhr) {
					ctx.dispatcher.trigger("login:user-authenticated");
				}, 'json');

				xhr.fail(function(xhr, status, errorThrown) {
					if (xhr.status == 401 && (errMsg = $.evalJSON(xhr.responseText).error)) {
						ctx.message.error(errMsg, { title: "Couldn't Log You In", subhead: "Sorry!" });
					} else {
						ctx.message.error(errorThrown, { title: "An Error Occurred", subhead: xhr.status });
					}
				});

			} else {
				this.message.error("You must enter an email address and password.", { subhead: "Sorry!" });
			}
			// authenticate against the server
			// if successful, set credentials, hide and go to the view that we were last at
			// otherwise display an error message
			return false;
		},

		reset_password: function() {
			this.dispatcher.trigger("login:show-reset");
		},

		validate: function() {
			var email = this.$("#email").val();
			var password = this.$("#password").val();

			if (email && password) {
				this.$("#email").val("");
				this.$("#password").val("");
				return { 'user[email]': email, 'user[password]': password, 'user[remember_me]': this.$("#remember_me").prop("checked") }
			} else {
				return false;
			}
		},

		show: function(opts) {
			if (opts && opts.passwordReset) {
				this.message.success("An email has been sent to " + opts.passwordReset + " with instructions on how to complete the password reset process.",
								     { title: "Password Reset Email Sent", show_close_button: true });
			}

			this.mwin.modal('show');
		},

		hide: function() {
			this.mwin.modal('hide');
		},

		render: function() {
			this.$el.html(loginTemplate);
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

	return LoginView;
});