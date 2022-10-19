module BetterParams
  # Auxiliary class for converting values
  class Converters
    # Converts to a Boolean value
    def self.to_b(value)
      return true if value.is_a? TrueClass
      return false if value.is_a? FalseClass

      downcased_value = value.to_s.downcase

      return true if ['true', '1'].include?(downcased_value)
      return false if ['false', '0'].include?(downcased_value)

      nil
    end
  end
end
