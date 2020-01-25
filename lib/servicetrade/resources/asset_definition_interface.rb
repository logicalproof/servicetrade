module Servicetrade
  class AssetDefinitionInterface < Servicetrade::ResourceInterface
    
    def allowed_verbs
      return ["GET"]
    end
    
    def base_url
      return "/assetdefinition"
    end

    def name
      return "assetDefinitions"
    end

    def get_params
      return {
        active: { 
          type: "boolean", optional: true, allowed_values: [], message: "true to get just asset definitions enabled in the requesting user's account, false or omit to get all definitions" 
        },
        updatedAfter: { 
          type: "integer", optional: true, allowed_values: [], message: "return only definitions whose last update time is on or after the given timestamp" 
        },
        updatedBefore: { type: "integer", optional: true, allowed_values: [], message: "return only definitions whose last update time is on or after the given timestamp"
        }
      }
    end

  end

end
