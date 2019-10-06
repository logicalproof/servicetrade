module Servicetrade
  module Action
    class ClockIn < Servicetrade::ResourceInterface
      def base_url
        return "/clock"
      end

      def name
        return "events"
      end
    end
  end
end