module BetterParams
  # Auxiliary class for converting values
  class Converters
    # Converts to a Boolean value
    def self.to_b(value)
      return true if value.is_a? TrueClass
      return false if value.is_a? FalseClass

      value.to_s.downcase == 'true'
    end
  end
end
