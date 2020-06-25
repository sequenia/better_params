module BetterParams
  module Base
    module ConvertKeys
      # Not used directly
      def convert_keys(keys, &block)
        merge_attributes = ->(params, key, attributes) do
          params.merge(block.call(key) => attributes).except(key)
        end

        params = self
        keys.each do |key|
          if key.is_a? Hash
            key.each do |nested_key, key_from_key|
              nested_params = params[nested_key]
              next if nested_params.nil?

              nested_attributes =
                if nested_params.is_a?(Array)
                  nested_params.map do |item|
                    item.convert_keys(key_from_key, &block)
                  end
                else
                  nested_params.convert_keys(key_from_key, &block)
                end

              params = merge_attributes.call(
                params,
                nested_key,
                nested_attributes
              )
            end
          else
            attributes = params[key]
            next if attributes.nil?

            params = merge_attributes.call(params, key, attributes)
          end
        end

        params
      end
    end
  end
end
