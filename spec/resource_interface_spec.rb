require "spec_helper"

RSpec.describe Servicetrade::ResourceInterface do
  before(:all) do
    username = ENV["SERVICETRADE_USERNAME"] #set a valid username in .env
    password = ENV["SERVICETRADE_PASSWORD"] #set a valid password in .env
    sa = Servicetrade::Authenticator.new username, password
    sa.get_auth_token
  end

  context 'when a resource_interface is initialized with a job' do
    resource = Servicetrade::Job.new
    resource_interface = Servicetrade::ResourceInterface.new(resource)
    it "should allow a job resource class" do 
      expect(resource_interface.url).to eq("https://api.servicetrade.com/api/job")
    end
    it "should allow a get_all request" do
      all_jobs = resource_interface.get_all
      expect(all_jobs).to be_instance_of(Array)
      expect(all_jobs.count).to be > 1
    end
    it "should allow a get_one request" do
      resource.id = "8498661"
      one_job = resource_interface.get_all
      expect(one_job).to be_instance_of(Hash)
      expect(one_job["id"]).to eq(8498661)
    end
  end

  context 'when a resource_interface is initialized with a tag' do
    resource = Servicetrade::Tag.new
    resource_interface = Servicetrade::ResourceInterface.new(resource)
    it "should allow a tag resource class" do 
      expect(resource_interface.url).to eq("https://api.servicetrade.com/api/tag")
    end
    it "should allow a get_all request" do
      all_tags = resource_interface.get_all
      expect(all_tags).to be_instance_of(Array)
      expect(all_tags.count).to be > 1
    end
    it "should allow a get_one request" do
      resource.id = "225396"
      one_tag = resource_interface.get_all
      expect(one_tag).to be_instance_of(Hash)
      expect(one_tag["id"]).to eq(225396)
    end
  end

end
