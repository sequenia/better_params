module BetterParams
  module Base
    module StripValues
      def strip_values(*keys)
        keys.reduce(self) do |result, key|
          if key.is_a?(Hash)
            key.reduce(result) do |hash_result, (hash_key, hash_value)|
              next hash_result unless hash_result.key?(hash_key)

              nested = hash_result[hash_key]
              next hash_result if nested.nil?

              nested =
                if nested.is_a?(Array)
                  nested.map do |nested_object|
                    nested_object.strip_values(*hash_value)
                  end
                else
                  nested.strip_values(*hash_value)
                end

              hash_result.merge(hash_key => nested)
            end
          else
            next result unless result.key?(key)

            result.merge(key => result[key]&.strip)
          end
        end
      end
    end
  end
end
