module Servicetrade
  class WarehouseInterface < Servicetrade::ResourceInterface

    def allowed_verbs
      return ["GET", "POST", "PUT"]
    end

    def base_url
      return "/warehouse"
    end

    def name
      return "warehouses"
    end

    def post_params
      post_parameters = self.put_params
      return post_parameters
    end

    def put_params
      return {  name: {type:"string", optional: false, allowed_values:[], message: "the name of the tag you wish to create - if one by that name already exists it will be returned without creating a duplicate"},
                status: {type:"string", optional: true, allowed_values:['active', 'inactive', 'all'], message: "one of 'active', 'inactive', defaults to active"},
                officeId: {type:"integer", optional: true, allowed_values:[], message: "locationId of office or null. Defaults to null"} 
              }
    end
    

    def get_params
      return {officeId: {type:"integer", optional: true, allowed_values:[], message: "id of office whose warehouses you want to see"},
              status: {type:"string", optional: true, allowed_values:['active', 'inactive', 'all'], message: "defaults to 'active', or one of 'active', 'inactive', 'all'"},
                createdBefore: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records created on or before"},
                createdAfter: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records created on or after"},
                updatedBefore: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records updated on or before"},
                updatedAfter: {type:"integer", optional: true, allowed_values:[], message: "timestamp, matches records updated on or after"},
              }
    end

  end

end
