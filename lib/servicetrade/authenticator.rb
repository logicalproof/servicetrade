
module Servicetrade

  class Authenticator
    attr_writer :username, :password
    attr_reader :user


    def initialize(username, password)
      @username = username
      @password = password
      @auth_token = 'empty'
      @user = nil
      get_auth_token
    end

    def get_auth_token
      begin
        response = RestClient.post 'https://api.servicetrade.com/api/auth', 
                        { username: @username,
                          password: @password }
      rescue
        self.set_auth_token = "Error:Invalid/Missing Credentials"
        puts "Error:Invalid/Missing Credentials"
      end
      unless response.nil?
        @auth_token = JSON.parse(response.body)["data"]["authToken"]
        @user = JSON.parse(response.body)["data"]["user"]
      end
    end

    def auth_token
      @auth_token
    end


  end
end