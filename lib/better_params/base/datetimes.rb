module BetterParams
  module Base
    module Datetimes
      def datetimes(*keys)
        transform_values_for_keys(*keys) { |value| value && Time.parse(value) }
      end
    end
  end
end
