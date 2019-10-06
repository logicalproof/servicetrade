module Servicetrade
  module Action
    class ClockIn
      attr_reader :url

      def initialize(job_id, event_id=nil)
        @job_id = job_id
        if event_id
          @event_id = "/" + event_id 
        else
          @event_id = ""
        end
        @url = base_url
      end

      def allowed_verbs
        return ["POST"]
      end
      
      def base_url
        return "/job/#{@job_id}/clockin#{@event_id}"
      end

      def name
        return "events"
      end

      def post_params
        return {  lat: {type: "float", optional: true, allowed_values: [], message: "GPS latitude"},
                  lon: {type: "float", optional: true, allowed_values: [], message: "GPS longitude"}
                }
      end
    end
  end
end