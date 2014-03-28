class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper 
  # --By default, helpers are only available in the VIEWS 
  # but not in the CONTROLLERS. This makes it available in the controller too.

end
