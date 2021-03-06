define([
	'jquery', 
	'backbone', 
	'underscore', 
	'text!templates/orders/edit.html',
	'models/order'
], function($, Backbone, _, editTpl, Order) {
	var OrderEditView = Backbone.View.extend({
		events: {
			//'click '
		},

		initialize: function(listArea) {
			this.setElement(listArea);
			this.template = _.template(editTpl);
		},

		render: function() {
			ctx = this;
			console.log("Rendering order edit");
			
			this.order = new OrderCollection();
      		var req = this.orders.fetch({ 
      			success: function(collection, response) {
      				console.log("Rendering orders");
      					var data = { 
      							columns: [
      								{ header: "Created", link: { href: "#orders", data_id: 'id' , prop: 'created_at'}},
      								{ header: 'Client', prop: 'client_id' },
      								{ header: 'Delivery Type', prop: 'delivery_type' }
      							],
      							items: collection.models
      						};
      					ctx.$el.html(ctx.template(data));
      				}
      		});
			
		}
	});

	return OrderEditView;
});