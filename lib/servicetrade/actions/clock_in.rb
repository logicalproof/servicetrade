module Servicetrade
  module Action
    class ClockInAction < Servicetrade::ResourceInterface
      def base_url
        return "/clock"
      end

      def name
        return "events"
      end
    end
  end
end