module Servicetrade
  module Action
    class PrepareAttachment
      attr_reader :url

      def initialize
        @url = base_url
      end

      def allowed_verbs
        return ["POST"]
      end
      
      def base_url
        return "/attachment"
      end

      def name
        return ""
      end

      def post_params
        return { description: 
                  { type: "string", optional: true, allowed_values: [], message: "description of the content of the attachment" },
                jsonp:       
                  { type: "string", optional: true, allowed_values: [], message: "name of the Javascript callback in which to wrap the response" },
                purposeId:   
                  { type: "attachment purpose type", optional: false, allowed_values: [], message: "purpose constant for the attachment (cannot be updated)" },
                entityId:    
                  { type: "integer", optional: false, allowed_values: [], message: "id of the entity to attach to (cannot be updated)" },
                entityType:  
                  { type: "entity type", optional: false, allowed_values: [], message: "entity type constant of the entity to attach to (cannot be updated)" },
                visibility:  
                  { type: "array(string)", optional: true, allowed_values: ["public","customer","subcontractor"], message: "visibility granted to these types of viewers outside of the account; combination of: public, customer, subcontractor. 'public' indicates global visibility and overrides the other values. Will default to account default if no value is provided on POST." },
                file:
                  { type: "ruby File object", optional: false, allowed_values: [], message: "This is the file to upload and must be a Ruby File obeject in the form of File.open('path/to/file/.txt','rb')" }
                }

      end
    end
  end
end