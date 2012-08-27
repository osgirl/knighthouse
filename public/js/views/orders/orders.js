define([
	'jquery', 
	'backbone', 
	'underscore', 
	'text!templates/orders/orders.html',
	'views/orders/order_list'
], function($, Backbone, _, orderTemplate, OrderList) {
	var OrdersView = Backbone.View.extend({
		events: {
			
		},

		initialize: function(dispatcher) {
			this.dispatcher = dispatcher;
		},

		render: function() {
			ctx = this;
			this.$el.html(orderTemplate);
			$("body .body-container").html(this.el);
			this.orderList = new OrderList('.list-area');
			this.orderList.render();
		}
	});

	return OrdersView;
});