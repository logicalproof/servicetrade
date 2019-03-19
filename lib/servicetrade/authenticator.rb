
module Servicetrade

  class Authenticator
    attr_writer :user, :password
    def initialize(user, password)
      @user = user
      @password = password 
    end

    def get_auth_token
      begin
        response = RestClient.post 'https://api.servicetrade.com/api/auth', 
                        { username: @user,
                          password: @password }
      rescue
        Servicetrade.set_auth_token = "Error:Invalid/Missing Credentials"
        puts "Error:Invalid/Missing Credentials"
      end
      unless response.nil?
        Servicetrade.set_auth_token = JSON.parse(response.body)["data"]["authToken"]
      end
    end
  end


end