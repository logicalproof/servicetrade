require "spec_helper"

RSpec.describe Servicetrade::Authenticator do
  context "With valid credentials" do
   
    it "should recieve and store an authorization token" do
      username = ENV["SERVICETRADE_USERNAME"] #set a valid username in .env
      password = ENV["SERVICETRADE_PASSWORD"] #set a valid password in .env
      sa = Servicetrade::Authenticator.new username, password
      sa.get_auth_token
      expect(Servicetrade.auth_token.length).to eq(26)
    end

  end

  context "Without valid credentials" do
    
    it "should receive an error missing credentials message" do
      username = "nope"
      password = "wrong"
      sa = Servicetrade::Authenticator.new username, password
      sa.get_auth_token
      expect(Servicetrade.auth_token).to eq("Error:Invalid/Missing Credentials")
    end

  end
  
end
