class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  validates :name, length: { minimum: 2 }
  validates :phone_number length: { is:6 }
  validates
  protect_from_forgery with: :exception
end
