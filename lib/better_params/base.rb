require 'better_params/converters'
require 'better_params/params_destroy_info'

require 'better_params/base/convert_keys'
require 'better_params/base/transform_values_for_keys'

require 'better_params/base/add_destroy_info'
require 'better_params/base/booleans'
require 'better_params/base/datetimes'
require 'better_params/base/prepare_nested_attributes'
require 'better_params/base/remove_blanks'
require 'better_params/base/replace_blanks_by_nil'
require 'better_params/base/strip_values'

module BetterParams
  # The module depends on the 'params' controller instance variable
  module Base
    extend ActiveSupport::Concern

    include ConvertKeys
    include TransformValuesForKeys

    include AddDestroyInfo
    include Booleans
    include Datetimes
    include PrepareNestedAttributes
    include RemoveBlanks
    include ReplaceBlanksByNil
    include StripValues
  end
end
