module Servicetrade
  class JobItemInterface < Servicetrade::ResourceInterface

    def allowed_verbs
      return ["GET", "POST", "PUT", "DELETE"]
    end

    def base_url
      return "/jobitem"
    end

    def name
      return "jobItems"
    end

    def post_params
      post_parameters = self.put_params
      return post_parameters
    end

    def put_params
      #many more to implement
      return {  name: {type:"string", optional: false, allowed_values:[], message: "display name of the job item"}}
    end
    

    def get_params
      return {  jobId: {type:"integer", optional: true, allowed_values:[], message: "return job items on this job"},
                jobOfficeId: {type:"integer", optional: true, allowed_values:[], message: "return job items for jobs at this office"},
                createdBefore: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records created on or before"},
                createdAfter: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records created on or after"},
                updatedBefore: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records updated on or before"},
                updatedAfter: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records updated on or after"},
                usedOnBefore: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records used on or before"},
                usedOnAfter: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records used on or after"},
                libItemType: {type:"string", optional: true, allowed_values:[], message: "single or comma separated values of lib item types (lowercase names)"}
              }
    end

  end

end
