require "spec_helper"

RSpec.describe Servicetrade::TagInterface do
  before(:all) do  
    username = ENV["SERVICETRADE_USERNAME"] #set a valid username in .env
    password = ENV["SERVICETRADE_PASSWORD"] #set a valid password in .env
    authenticator = Servicetrade::Authenticator.new username, password
    authenticator.get_auth_token
  end

  it "Gets all tags" do
    tag = Servicetrade::TagInterface.new
    expect(tag.get_all).to be_instance_of(Array)
  end
end
