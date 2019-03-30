module Servicetrade

  class ApiInterface
    attr_accessor :url
    def initialize(resource)
      @resource = resource
      @url = Servicetrade.endpoint_host + @resource.url
      @name = @resource.name
    end

    def get(params={})
      set_url
      response = raw_get(params)
      
      parsed_response = parse_response(response)
      resources = parsed_response
      if paginated?(parsed_response)
        resources = parsed_response[@name]
        resources += get_paginated_resource(parsed_response, params)
      end
      resources
    end

    def post(params={})
      set_url
      validate_post_params(params)
      response = raw_post(params)
      parsed_response = parse_response(response)
    end

    def put(params={})
      set_url
      validate_put_params(params)
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
    
    def raw_get(params={})
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

    def raw_post(params={})
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
    def validate_put_params(params={})
      required_keys = get_required_put_params
      unless required_keys.all? { |e| params.include?(e) }
        raise "Missing Required Params: #{required_keys}"
      end
    end

    def get_required_put_params
      required_keys = []
      put_params = @resource.put_params
      put_params.each_key do |key|
        if put_params[key.to_sym][:optional] == false
          required_keys << key
        end
      end
      required_keys
    end
    def get_required_post_params
      required_keys = []
      post_params = @resource.post_params
      post_params.each_key do |key|
        if post_params[key.to_sym][:optional] == false
          required_keys << key
        end
      end
      required_keys
    end


  end
end