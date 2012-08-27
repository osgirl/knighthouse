class HomeController < ApplicationController
	before_filter :authenticate_user!
	layout 'application2'

  def index
      render :layout => "application2"
  end

  def import

  end

  def settings
  	settings = {
  		name: current_user.name,
  		email: current_user.email,
  		navitems: [
			          { nav: "home", name: "Home", icon: "home" },
			          { nav: "orders", name: "Orders", icon: "inbox" },
			          { nav: "deliveries", name: "Deliveries", icon: "road" },
			          { nav: "receiving", name: "Receiving", icon: "repeat" },
			          { nav: "administration", name: "Administration", icon: "list-alt" },
			        ]

  		}
  	render :json => settings
  end

end
