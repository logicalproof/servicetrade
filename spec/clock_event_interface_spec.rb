require "spec_helper"

RSpec.describe Servicetrade::ClockEventInterface do
  resource = Servicetrade::ClockEventInterface.new
  context "when a clock event interface is created" do
    it "should return a list of allowed verbs" do
      expect(resource.allowed_verbs).to eq(["GET"])
    end
    it "should return a resource url without an id" do
      expect(resource.base_url).to eq("/clock")
    end
  end

  context "get_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.get_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(resource.get_params[:autoAssignContract]).to eq(nil)
    end
    it "should include boolean for counts :type" do
      expect(resource.get_params[:openClockEvents][:type]).to eq("boolean")
    end
  end

  context "with a api_interface and a userId" do
    it "should return a clock event if the user is clocked in" do
      username = ENV["SERVICETRADE_USERNAME"] #set a valid username in .env
      password = ENV["SERVICETRADE_PASSWORD"] #set a valid password in .env
      resource = Servicetrade::ClockEventInterface.new
      sa = Servicetrade::Authenticator.new username, password
      user = 294416
      api = Servicetrade::ApiInterface.new(resource, sa)
      job_id = api.get(userId: user, openClockEvents: true).first['job']['id']
      job_resource = Servicetrade::JobInterface.new
      api = Servicetrade::ApiInterface.new(job_resource, sa)
      job = api.get(id: job_id)
    end
  end
end
