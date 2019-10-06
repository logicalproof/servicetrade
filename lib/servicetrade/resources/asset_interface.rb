module Servicetrade
  class AssetInterface < Servicetrade::ResourceInterface
    
    def allowed_verbs
      return ["GET"]
    end
    
    def base_url
      return "/asset"
    end

    def name
      return "assets"
    end

    def get_params
      return {  locationId: { type: "integer", optional: true, allowed_values: [], message: "returns all assets at the given location" },
                type: { type: "string", optional: true, allowed_values: [], message: "returns all assets of the given type" },
                status: { type: "string", optional: true, allowed_values: ['active', 'inactive'], message: "comma-separated list of statuses: 'active', 'inactive' (will default to 'active' if not supplied)" },
                parentId: { type: "integer", optional: true, allowed_values: [], message: "returns all assets subassets of the given parent asset" },
                name: { type: "string", optional: true, allowed_values: [], message: "returns all assets whose name includes this string (case insensitive)"},
                search: { type: "string", optional: true, allowed_values: []. message: "Performs simple search across asset text fields" }
              }
    end

  end

end
