class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter do
  	Time.zone = "Pacific Time (US & Canada)"
  end
end
