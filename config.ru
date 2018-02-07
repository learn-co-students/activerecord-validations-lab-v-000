# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
require 'pry'
require 'active_model/validations'
run Rails.application
