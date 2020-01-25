module Servicetrade
  class AssetInterface < Servicetrade::ResourceInterface
    
    def allowed_verbs
      return ["GET", "POST", "PUT"]
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
                search: { type: "string", optional: true, allowed_values: [], message: "Performs simple search across asset text fields" }
              }
    end

  end


  def post_params
      post_parameters = self.put_params
      post_parameters[:locationId] = {type:"integer", optional: false, allowed_values:[], message: "Location to which the asset belongs. Required for POST. Supported on POST only."}
      post_parameters[:type] = {type:"string", optional: false, allowed_values:[], message: "Type of asset. Required for POST. Supported on POST only."}
      return post_parameters
    end

    def put_params
      return {properties: {type:"object", optional: false, allowed_values:[], message: "Set of key/value property pairs specific to this type of asset. Required for POST."},
              status: {type:"string", optional: true, allowed_values:[], message: "Status of asset; one of: 'active' or 'inactive'. If not provided for POST, defaults to 'active'."},
              orderIndex: {type:"integer", optional: true, allowed_values:[], message: "Items are listed from low to high value, null is the default value. Optional"},
              parentId: {type:"integer", optional: true, allowed_values:[], message: "Sets the parent asset of this asset. Parent asset type must be allowable for this asset type."}
              }
    end

end
