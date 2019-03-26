module Servicetrade

  class ResourceInterface
    attr_accessor :url
    def initialize(resource)
      @resource = resource
      @url = Servicetrade.endpoint_host + @resource.url
      @name = @resource.name
    end

    def get_all(params={})
      set_url
      puts @url
      response = get(params)
      
      parsed_response = parse_response(response)
      resources = parsed_response
      if paginated?(parsed_response)
        resources = parsed_response[@name]
        resources += get_paginated_resource(parsed_response, params)
      end
      resources
    end


    private

    def parse_response(response)
      parsed_response = JSON.parse(response.body)["data"]
    end

    def paginated?(response)
      if response["totalPages"].nil?
        return false
      else
        return true
      end
    end


    def get_paginated_resource(response, params)
      resources = []
      if response["totalPages"] > 1
        2.upto(response["totalPages"]) do |n|
          params[:page] = n
          paginated_response = get(params)
          resources += JSON.parse(paginated_response.body)["data"][@name]
        end
      end 
      return resources
    end


    def set_url
      @url = Servicetrade.endpoint_host + @resource.url
    end
    
    def get(params={})
      begin
        response = RestClient.get @url, 
                        {  
                          cookies: {
                            PHPSESSID: Servicetrade.auth_token}, 
                            params: params
                          }                    
      rescue => error
        response = error
      end
      return response
    end





      def set_params(http_verb,resource_type)
        case http_verb
        when "POST"
          
        when "GET"
          
        when "PUT"
          
        when "DELETE"
          raise "Not Allowed"
        else
          raise "Error"
        end
      end



  end
end