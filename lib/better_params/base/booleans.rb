module BetterParams
  module Base
    module Booleans
      def booleans(*keys)
        transform_values_for_keys(*keys) do |value|
          Converters.to_b(value) unless value.nil?
        end
      end
    end
  end
end
