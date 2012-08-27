define([
	'jquery', 
	'backbone', 
	'underscore', 
	'text!templates/home/home.html',
	'views/orders/order_list'
], function($, Backbone, _, homeTemplate, OrderList) {
	var HomeView = Backbone.View.extend({
		events: {
			
		},

		initialize: function(dispatcher) {
			this.dispatcher = dispatcher;
		},

		render: function() {
			ctx = this;
			this.$el.html(homeTemplate);
			$("body .body-container").html(this.el);
			this.orderList = new OrderList('.list-area');
			this.orderList.render();
		}
	});

	return HomeView;
});