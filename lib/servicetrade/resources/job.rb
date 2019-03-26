module Servicetrade
  
  class Job
    attr_accessor :id, :url, :name
    
    def initialize(id="")
      @id = id
      @url = "/job" + add_id(@id)
      @name = "jobs"
    end

    def id=(id)
      @id = id
      @url = @url + "/#{id.to_s}"
    end

    def allowed_verbs
      if id == ""
        return ["GET", "POST"]
      else
       return ["GET", "PUT"]
      end
    end

    def self.list_post_params
      post_params = self.list_put_params
      post_params[:autoAssignContract] = {type:"boolean", optional: true, allowed_values:[], message: "(optional, POST only) if job default contract can be uniquely determined, set it to that value"}
      return post_params
    end

    def self.list_put_params
      return {locationId: {type:"integer", optional: false, allowed_values:[], message: "location the job is to be performed at"},
              vendorId: {type:"integer", optional: false, allowed_values:[], message: "id of vendor company assigned to this job"},
              customerId: {type:"integer", optional: true, allowed_values:[], message: "(optional) id of customer company assigned to this job (if not given, location company is used)"},
              brokerId: {type:"integer", optional: true, allowed_values:[], message: "(optional) id of broker company assigned to this job (if not given, vendor company is used)"},
              ownerId: {type:"integer", optional: true, allowed_values:[], message: "(optional) id of the user assigned as the owner of this job"},
              salesId: {type:"integer", optional: true, allowed_values:[], message: "(optional) id of the user assigned as the salesperson of this job"},
              termsId: {type:"integer", optional: true, allowed_values:[], message: "(optional) id of the Terms and Conditions to use for this job"},
              contractId: {type:"integer", optional: true, allowed_values:[], message: "(optional) id of the contract to use for this job"},
              type: {type:"string", optional: false, allowed_values:["unknown", "repair", "construction", "upgrade", "service_call", "urgent_service_call", "priority_service_call", "emergency_service_call", "cleaning", "inspection", "priority_inspection", "reinspection", "survey", "preventative_maintenance", "quality_assurance", "inspection_repair", "delivery", "pickup", "exchange", "sales", "installation", "warranty", "training", "testing", "administrative", "replacement", "design", "hookup"], message: "one of: unknown, repair, construction, upgrade, service_call, urgent_service_call, priority_service_call, emergency_service_call, cleaning, inspection, priority_inspection, reinspection, survey, preventative_maintenance, quality_assurance, inspection_repair, delivery, pickup, exchange, sales, installation, warranty, training, testing, administrative, replacement, design, hookup"},
              status: {type:"string", optional: true, allowed_values:[], message: "(optional) one of: new, canceled, bidding, scheduled, completed, pending_invoice, sending_invoice, invoiced, closed. invoiced status is DEPRECATED and should not be used."},
              visibility: {type:"array(string)", optional: true, allowed_values:["public", "customer", "subcontractor", "description", "appointments"], message: "(optional) visibility granted to these types of viewers outside of the account; combination of: public, customer, subcontractor, description, appointments."},
              serviceRequestIds: {type:"array (integer)", optional: true, allowed_values:[], message: "(optional) services to be fulfilled by this job (services must belong to the job's location)"},
              customerPo: {type:"string(40)", optional: true, allowed_values:[], message: "(optional) customer purchase order number for this job"},
              description: {type:"string", optional: true, allowed_values:[], message: "(optional) description of job"}
              }
    end

    def self.list_get_params
      return {  id: {type: "integer", optional: true, allowed_values: [],message: "id for a single job"},
                jobIds: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of job ids"},
                lat: {type: "double", optional: true, allowed_values: [], message: "latitude of current location; must also supply lon"},
                lon: {type: "double", optional: true, allowed_values: [], message: "longitude of current location; must also supply lat"},
                radius: {type: "double", optional: true, allowed_values: [], message: "radius in miles to search around; must also supply lat and lon"},
                status: {type: "string", optional: true, allowed_values: ["all", "new", "canceled", "bidding", "completed", "pending_invoice", "sending_invoice", "scheduled", "closed"], message: "job status; one of: all (excluding canceled), new, canceled, bidding, completed, pending_invoice, sending_invoice, invoiced, closed (will default to 'scheduled' if not supplied, unless a job number is supplied). invoiced status is DEPRECATED and should not be used; use isInvoiced to find invoiced jobs."},
                isInvoiced: {type: "boolean", optional: true, allowed_values: [], message: "filter jobs by invoiced status (if true, only jobs with a non-voided customer invoice will be returned)"},
                type: {type: "string", optional: true, allowed_values: ["unknown", "repair", "construction", "upgrade", "service_call", "urgent_service_call", "priority_service_call", "emergency_service_call", "cleaning", "inspection", "priority_inspection", "reinspection", "survey", "preventative_maintenance", "quality_assurance", "inspection_repair", "delivery", "pickup", "exchange", "sales", "installation", "warranty", "training", "testing", "administrative", "replacement", "design", "hookup"], message: "comma-separated list of: unknown, repair, construction, upgrade, service_call, urgent_service_call, priority_service_call, emergency_service_call, cleaning, inspection, priority_inspection, reinspection, survey, preventative_maintenance, quality_assurance, inspection_repair, delivery, pickup, exchange, sales, installation, warranty, training, testing, administrative, replacement, design, hookup"},
                number: {type: "integer", optional: true, allowed_values: [], message: "comma-separated list of job numbers; if this parameter is supplied, all job statuses are searched unless a specific status is also supplied"},
                ivrStatus: {type: "string", optional: true, allowed_values: ["open"], message: "job’s clockin status; one of: open (only one supported currently)"},
                locationId: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of ids of the location of the job"},
                vendorId: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of ids of the vendor which performed the job"},
                customerId: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of ids of the customer for whom the job was performed"},
                techId: {type: "integer", optional: true, allowed_values: [], message: "return jobs with the tech assigned to an appointment on the job (DEPRECATED: use techIds)"},
                techIds: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of integers of user ids for technicians assigned to an appointment on the job"},
                ownerId: {type: "integer", optional: true, allowed_values: [], message: "id of the user assigned as the owner of this job"},
                salesId: {type: "integer", optional: true, allowed_values: [], message: "comma-separated list of integer ids of the user assigned as the salesperson of this job"},
                officeIds: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of integers of office ids for offices servicing the job location"},
                appointmentStatus: {type: "string", optional: true, allowed_values: ["unscheduled", "scheduled", "canceled_by_vendor", "canceled_by_customer", "completed", "no_show"], message: "comma-separated list: unscheduled, scheduled, canceled_by_vendor, canceled_by_customer, completed, no_show"},
                regionIds: {type: "string", optional: true, allowed_values: [], message: "comma delimited list of integers of region ids, returns only jobs at locations within any of those regions"},
                sort: {type: "string", optional: true, allowed_values: ["distance","clockin"], message: "how to sort results; one of: distance, clockin (distance requires lat and lon to be set)"},
                longForm: {type: "boolean", optional: true, allowed_values: [], message: "returns the long form job object defaults to false"},
                dueByBegin: {type: "integer", optional: true, allowed_values: [], message: "Unix timestamp, only return jobs due on this date or later"},
                dueByEnd: {type: "integer", optional: true, allowed_values: [], message: "Unix timestamp, only return jobs due on this date or earlier"},
                completedOnBegin: {type: "integer", optional: true, allowed_values: [], message: "Unix timestamp, only return jobs completed at this time or later"},
                completedOnEnd: {type: "integer", optional: true, allowed_values: [], message: "Unix timestamp, only return jobs completed at this time or earlier"},
                scheduleDateFrom: {type: "integer", optional: true, allowed_values: [], message: "Unix timestamp, only return jobs with appointments scheduled at this time or later. If scheduleDateTo is also provided, only return jobs with appointments scheduled in this range."},
                scheduleDateTo: {type: "integer", optional: true, allowed_values: [], message: "Unix timestamp, only return jobs with appointments scheduled at this time or earlier. If scheduleDateFrom is also provided, only return jobs with appointments scheduled in this range."},
                noDueBy: {type: "integer", optional: true, allowed_values: [], message: "truthy value to return only jobs without a due by"},
                estimatedPriceFrom: {type: "double", optional: true, allowed_values: [], message: "Only return jobs with an estimated price greater than or equal (null price excluded)"},
                estimatedPriceTo: {type: "double", optional: true, allowed_values: [], message: "Only return jobs with an estimated price less than or equal (null price excluded)"},
                serviceLineIds: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of service line ids"},
                tag: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of tag strings, only jobs with all tags will be returned"},
                limit: {type: "integer", optional: true, allowed_values: [], message: "limit the jobs returned - takes radius into account if specified (default 2000, maximum 2000)"},
                createdBefore: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records created on or before"},
                createdAfter: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records created on or after"},
                updatedBefore: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records updated on or before"},
                updatedAfter: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records updated on or after"}
              }
    end

    private

      def add_id(id)
        if id == ""
          return ""
        else
          return "/#{id}"
        end
      end

  end

end
