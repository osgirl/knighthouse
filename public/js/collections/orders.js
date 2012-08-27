define([
  'jquery',
  'underscore',
  'backbone',
  'models/order'
], function($, _, Backbone, Order){
  var ordersCollection = Backbone.Collection.extend({
    model: Order,
    url: 'orders'

  });

  return ordersCollection;
});
