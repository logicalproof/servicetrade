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
      response = get(params)
      
      parsed_response = parse_response(response)
      resources = parsed_response
      if paginated?(parsed_response)
        resources = parsed_response[@name]
        resources += get_paginated_resource(parsed_response, params)
      end
      resources
    end

    def post_no_entity(params={})
      set_url
      validate_post_params(params)
      response = post(params)
      parsed_response = parse_response(response)
    end

    def put(params={})
      set_url
      validate_post_params(params)
      response = raw_put(params)
      parsed_response = parse_response(response)
    end

    private

    def parse_response(response)
      parsed_response = JSON.parse(response.body)["data"]
      parsed_response["response_code"] = response.code
      return parsed_response
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

    def post(params={})
      begin
        response = RestClient.post @url,
                        params.to_json,
                        {:cookies => {PHPSESSID: Servicetrade.auth_token}} 

      rescue => error
        response = error
      end
      return response

    end

    def raw_put(params={})
      begin
        response = RestClient.put @url,
                        params.to_json,
                        {:cookies => {PHPSESSID: Servicetrade.auth_token}} 

      rescue => error
        response = error
      end
      return response

    end

    def validate_post_params(params={})
      required_keys = get_required_post_params
      unless required_keys.all? { |e| params.include?(e) }
        raise "Missing Required Params: #{required_keys}"
      end
    end

    def get_required_post_params
      required_keys = []
      post_params = @resource.class.list_post_params
      post_params.each_key do |key|
        if post_params[key.to_sym][:optional] == false
          required_keys << key
        end
      end
      required_keys
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