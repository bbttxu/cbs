class ApplicationController < ActionController::Base
  protect_from_forgery

  http_basic_authenticate_with name: ENV['admin_user'], password: ENV['admin_password'], except: [ :current ]

end
