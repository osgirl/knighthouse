<table class="table-striped table">
  <thead>
  	<tr>
  		<% _.each(columns, function(col) { %>
  		<th><%= col.header %></th>
      <% }); %>
  	</tr>
  </thead>
  <tbody>
    <% _.each(items, function(item) { %>
  	<tr>
      <% _.each(columns, function(col) { %>
      <td>
        <% if (col.prop) { %>
        <%= item.get(col.prop) %>
        <% else if (col.link) { %>
        <a href="<%= item.get(col.link.href) %>"><%= item.get(col.link.prop) %></a>
        <% } %>
      </td>
      <% }); %>
  	</tr>
    <% }); %>
  </tbody>
 </table>