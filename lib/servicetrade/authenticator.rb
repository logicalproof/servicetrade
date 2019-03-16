
module ServiceTrade

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
        print "Error Not Authorized"  
      end
      ServiceTrade.set_auth_token = JSON.parse(response.body)["data"]["authToken"]
    end
  end


end