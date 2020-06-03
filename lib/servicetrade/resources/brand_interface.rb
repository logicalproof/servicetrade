module Servicetrade
  class BrandInterface < Servicetrade::ResourceInterface
    
    def allowed_verbs
      return ["GET"]
    end

    def base_url
      return "/brand"
    end

    def name
      return "brand"
    end

    def get_params
      return {  name: {type: "string", optional: true, allowed_values: [], message: "returns all deficiencies of the given status (new, invalid, verified, fixed)"}
                }
    end

  end

end
