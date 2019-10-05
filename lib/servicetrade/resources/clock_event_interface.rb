module Servicetrade
  class ClockEventInterface < Servicetrade::ResourceInterface
    
    def allowed_verbs
      return ["GET"]
    end
    
    def base_url
      return "/clock"
    end

    def name
      return "events"
    end

    def get_params
      return {  userId: {type: "integer", optional: true, allowed_values: [],message: "user id who created the event"},
                userIds: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of user ids"},
                startTime: {type: "integer", optional: true, allowed_values: [], message: "Unix timestamp of start of time range"},
                endTime: {type: "integer", optional: true, allowed_values: [], message: "Unix timestamp of end of time range"},
                source: {type: "string", optional: true, allowed_values: ["mobile", "ivr"], message: "Source of clock events; one of: mobile, ivr"},
                activity: {type: "string", optional: true, allowed_values: ["onsite", "offsite", "enroute"], message: "Activity type being clocked into/out of; one of: onsite, offsite, enroute"},
                openClockEvents: {type: "boolean", optional: true, allowed_values: [], message: "Return only open clock events (clock-ins without a corresponding clock-out) - requires userId or userIds"},
                jobId: {type: "integer", optional: true, allowed_values: [], message: "Return only events related to this job"},
                appointmentId: {type: "integer", optional: true, allowed_values: ["open"], message: "Return only events related to this appointment (must also provide jobId)"}
              }
    end

  end

end
