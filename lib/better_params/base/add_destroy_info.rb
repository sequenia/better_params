module BetterParams
  module Base
    module AddDestroyInfo
      def add_destroy_info(object, *keys)
        ParamsDestroyInfo.add(self, object, *keys)
      end
    end
  end
end
