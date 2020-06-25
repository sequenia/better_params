module BetterParams
  module Base
    module TransformValuesForKeys
      # Not used directly
      def transform_values_for_keys(*keys, &block)
        merge(slice(*keys).transform_values { |value| block.call(value) })
      end
    end
  end
end
