module BetterParams
  module Base
    module ReplaceBlanksByNil
      def replace_blanks_by_nil(*keys)
        transform_values_for_keys(*keys) { |value| value.blank? ? nil : value }
      end
    end
  end
end
