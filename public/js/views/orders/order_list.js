define([
	'jquery', 
	'backbone', 
	'underscore', 
	'text!templates/misc/table.html',
	'collections/orders'
], function($, Backbone, _, tableTpl, OrderCollection) {
	var OrderListView = Backbone.View.extend({
		events: {
			//'click '
		},

		initialize: function(listArea) {
			this.setElement(listArea);
			this.template = _.template(tableTpl);
		},

		render: function() {
			ctx = this;
			console.log("Rendering order list");
			
			this.orders = new OrderCollection();
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

	return OrderListView;
});