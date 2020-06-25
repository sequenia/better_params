module BetterParams
  module Base
    module RemoveBlanks
      def remove_blanks
        select { |_key, value| value.present? }
      end
    end
  end
end
