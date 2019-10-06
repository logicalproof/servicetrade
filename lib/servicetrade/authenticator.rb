
module Servicetrade

  class Authenticator
    attr_writer :user, :password


    def initialize(user, password)
      @user = user
      @password = password
      @auth_token = 'empty'
    end

    def get_auth_token
      begin
        response = RestClient.post 'https://api.servicetrade.com/api/auth', 
                        { username: @user,
                          password: @password }
      rescue
        self.set_auth_token = "Error:Invalid/Missing Credentials"
        puts "Error:Invalid/Missing Credentials"
      end
      unless response.nil?
        self.set_auth_token = JSON.parse(response.body)["data"]["authToken"]
      end
    end

    def auth_token
      @auth_token
    end

    private

      def set_auth_token=(token_string)
        @auth_token = token_string
      end

  end
end