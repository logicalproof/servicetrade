module Servicetrade
  class LocationInterface < Servicetrade::ResourceInterface
    
    def allowed_verbs
      return ["GET", "POST", "PUT", "DELETE"]
    end

    def base_url
      return "/location"
    end

    def name
      return "locations"
    end

    def post_params
      post_parameters = self.put_params
      post_parameters[:name][:optional] = false
      post_parameters[:address][:optional] = false
      post_parameters[:companyId][:optional] = false
      return post_parameters
    end

    def put_params
      return {name: {type: "string", optional: true, allowed_values: [], message: "The name of the location"},
              address: {type: "Address", optional: true, allowed_values: [], message: "Overrides individual address fields"},
              addressStreet: {type: "string", optional: true, allowed_values: [], message: "The street of the address for the location (alias for address.street)"},
              addressCity: {type: "string", optional: true, allowed_values: [], message: "The city of the address for the location (alias for address.city)"},
              addressState: {type: "string", optional: true, allowed_values: [], message: "The state of the address for the location (alias for address.state)"},
              addressPostalCode: {type: "string", optional: true, allowed_values: [], message: "The postal code of the address for the location (alias for address.postalCode)"},
              companyId: {type: "string", optional: true, allowed_values: [], message: "The ID for the company to which the location belongs"},
              officeIds: {type: "array (integer)", optional: true, allowed_values: [], message: "Offices assigned to this location (if not given, defaults to vendor company's primary office)"},
              phoneNumber: {type: "string", optional: true, allowed_values: [], message: "Phone number for the location itself (not a phone number for a contact)."},
              email: {type: "string", optional: true, allowed_values: [], message: "Email address for the location itself (not an email address for a contact)."},
              storeNumber: {type: "string", optional: true, allowed_values: [], message: "Store number for the location."},
              primaryContactId: {type: "integer", optional: true, allowed_values: [], message: "id of contact that should be the primary contact. Request will error out if the contact has been assigned to a different location or company. Null to clear current primary contact designation."},
              lat: {type: "float", optional: true, allowed_values: [], message: "GPS latitude"},
              lon: {type: "float", optional: true, allowed_values: [], message: "GPS longitude"},
              status: {type: "string", optional: true, allowed_values: ['active', 'pending', 'inactive'], message: "one of ('active', 'pending', 'inactive'), 'active' is the default"},
              taxable: {type: "boolean", optional: true, allowed_values: [], message: "should invoice items for invoices at this location be taxable by default? default value is false"},
              brandId: {type: "integer", optional: true, allowed_values: [], message: "id of the brand to associate with this location or null for none"}
              }
    end
    

    def get_params
      return {  name: {type: "string", optional: true, allowed_values: [], message: "string to find in the location name or store number"},
                companyId: {type: "string", optional: true, allowed_values: [], message: "comma delimited list of integers of company ids, return only locations belonging to any of these companies"},
                isCustomer: {type: "boolean", optional: true, allowed_values: [], message: "returns only customer locations, default true"},
                isVendor: {type: "boolean", optional: true, allowed_values: [], message: "returns only vendor offices"},
                updatedAfter: {type: "integer", optional: true, allowed_values: [], message: "return only locations whose last update time is on or after the given timestamp"},
                updatedBefore: {type: "integer", optional: true, allowed_values: [], message: "return only locations whose last update time is on or before the given timestamp"},
                createdBefore: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records created on or before"},
                createdAfter: {type: "integer", optional: true, allowed_values: [], message: "timestamp, matches records created on or after"},
                officeIds: {type: "string", optional: true, allowed_values: [], message: "comma delimited list of integers of office ids for offices servicing the location"},
                regionIds: {type: "string", optional: true, allowed_values: [], message: "comma delimited list of integers of region ids, returns only locations within any of those regions"},
                status: {type: "string", optional: true, allowed_values: ['active', 'inactive', 'pending'], message: "comma delimited list of statuses, returns only locations which have one of those statuses, one or more of: 'active', 'inactive', 'pending'"},
                companyStatus: {type: "string", optional: true, allowed_values: ['active', 'inactive', 'pending'], message: "returns only locations whose company has this status, one of: 'active', 'inactive', 'pending'"},
                tag: {type: "string", optional: true, allowed_values: [], message: "comma-separated list of tag strings, only locations with all tags will be returned"},
                limit: {type: "integer", optional: true, allowed_values: [], message: "limit the locations returned (default 10, maximum 5000)"}
              }
    end

  end

end