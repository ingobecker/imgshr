class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  ensure_security_headers if Rails.env.production?
end
