require 'rails'
require 'action_controller'
require 'better_params/railtie'
require 'better_params/base'

module BetterParams
end

ActionController::Parameters.include BetterParams::Base
