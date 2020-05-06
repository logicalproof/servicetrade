module Servicetrade
  class ServiceRequest < Servicetrade::ResourceInterface
    
    def allowed_verbs
      return ["GET", "POST", "PUT", "DELETE"]
    end

    def base_url
      return "/deficiency"
    end

    def name
      return "deficiencies"
    end

    def post_params
      post_parameters = self.put_params
      post_parameters[:assetId] = {type: "integer", optional: false, allowed_values: [], message: "must be an existing assetId"}
      return post_parameters
    end

    def put_params
      return {  severity: {type: "string", optional: true, allowed_values: ["inoperable", "deficient", "suggested"], message: "one of (inoperable, deficient, suggested), default is 'inoperable'"},
                description: {type: "string", optional: true, allowed_values: [], message: "description of the deficiency"},
                status: {type: "string", optional: true, allowed_values: [], message: "most recently reported status of deficiency"},
                resolution: {type: "string", optional: true, allowed_values: [], message: "most recently reported lifecycle state of deficiency"},
                proposedFix: {type: "string", optional: true, allowed_values: [], message: "description of proposed fix"},
                jobId: {type: "integer", optional: true, allowed_values: [], message: "job that produced this deficiency report"},
                serviceLineId: {type: "integer", optional: true, allowed_values: [], message: "service line for this deficiency (if different from the asset's service line)"},
                ownerId: {type: "integer", optional: true, allowed_values: [], message: "user assigned as the owner of this deficiency, default is null"},
                salesId: {type: "integer", optional: true, allowed_values: [], message: "user assigned as the salesperson of this deficiency, default is null"},
                reporterId: {type: "integer", optional: true, allowed_values: [], message: "user who reported this deficiency, default is currently logged-in user"},
                reportSource: {type: "string", optional: true, allowed_values: ["manual", "lsn", "ivr", "mobile", "jcw"], message: "one of (manual, lsn, ivr, mobile, jcw), default is 'mobile'"},
                visibility: {type: "array(string)", optional: true, allowed_values: [], message: "visibility granted to these types of viewers outside of the account; combination of: public, customer, subcontractor. 'public' indicates global visibility and overrides the other values. Will default to account default if no value is provided on POST."}
              }
    end

    def get_params
      return {  severity: {type: "string", optional: true, allowed_values: ["inoperable", "deficient", "suggested"], message: "returns all deficiencies of the given severity (inoperable, deficient, suggested)"},
                status: {type: "string", optional: true, allowed_values: ["new","invalid","verified","fixed"], message: "returns all deficiencies of the given status (new, invalid, verified, fixed)"},
                lastReportedStatus: {type: "string", optional: true, allowed_values: [], message: "alias for 'status'"},
                resolution: {type: "string", optional: true, allowed_values: ["new", "invalid", "fixed", "out_for_quote", "notified", "rejected"], message: "returns all deficiencies of the given resolution (new, invalid, fixed, out_for_quote, notified, rejected)"},
                assetId: {type: "integer", optional: true, allowed_values: [], message: "returns only deficiencies reported on the given asset, required unless id, ownerId, or locationId is provided"},
                locationId: {type: "string", optional: true, allowed_values: [], message: "comma delimited list of integers of location ids, returns only deficiencies reported at the given locations, required unless id, ownerId, or assetId is provided"},
                regionIds: {type: "string", optional: true, allowed_values: [], message: "comma delimited list of integers of region ids, returns only deficiencies at locations within any of those regions"},
                quoteRequestId: {type: "mixed", optional: true, allowed_values: [], message: "returns only deficiencies with quotes that address them, either an integer or the string 'false' to return un-quoted deficiencies"},
                ownerId: {type: "string", optional: true, allowed_values: [], message: "comma delimited list of integers of user ids, returns only deficiencies owned by those users"},
                salesId: {type: "string", optional: true, allowed_values: [], message: "comma delimited list of integers of user ids, returns only deficiencies with those users assigned as salesperson"},
                createdBefore: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records created on or before"},
                createdAfter: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records created on or after"},
                updatedBefore: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records updated on or before"},
                updatedAfter: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records updated on or after"},
                tag: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of tag strings, only deficiencies with all tags will be returned"}
                }
    end

  end

end
