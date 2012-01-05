class AdministrationController < ApplicationController
  layout 'main'
  before_filter :authenticate_user!

  def index
  end

end
