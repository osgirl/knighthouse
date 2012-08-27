module ApplicationHelper
	def application_title
		"Knighthouse"
	end

	def organization_name
		"Knights of Columbus"
	end

	def nav_items
		 [
			          { nav: "home", name: "Home", icon: "home" },
			          { nav: "orders", name: "Orders", icon: "inbox" },
			          { nav: "deliveries", name: "Deliveries", icon: "road" },
			          { nav: "receiving", name: "Receiving", icon: "repeat" },
			          { nav: "administration", name: "Administration", icon: "list-alt" }
			        ]
	end

	def chk_active(bool)
		raw(bool ? ' class="active"' : "")
	end
end
