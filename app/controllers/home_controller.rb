class HomeController < ApplicationController
	before_filter :authenticate_user!
	layout 'main'

  def index

  end

  def import

  end

  def settings

  end

end
