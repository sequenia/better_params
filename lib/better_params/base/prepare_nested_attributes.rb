module BetterParams
  module Base
    module PrepareNestedAttributes
      def prepare_nested_attributes(*keys)
        convert_keys(keys) { |key| "#{key}_attributes".to_sym }
      end
    end
  end
end
