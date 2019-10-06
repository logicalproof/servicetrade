require "spec_helper"

RSpec.describe Servicetrade::ApiInterface do
  before(:all) do
    username = ENV["SERVICETRADE_USERNAME"] #set a valid username in .env
    password = ENV["SERVICETRADE_PASSWORD"] #set a valid password in .env
    sa = Servicetrade::Authenticator.new username, password
    @sa = sa
  end


  context 'when a resource_interface is initialized with a job' do
    before(:each) do
      @resource = Servicetrade::JobInterface.new
      @resource_interface = Servicetrade::ApiInterface.new(@resource, @sa)
    end
    it "should allow a job resource class" do 
      expect(@resource_interface.url).to eq("https://api.servicetrade.com/api/job")
    end
    it "should allow a get request that retrieves multiple resources" do
      all_jobs = @resource_interface.get
      expect(all_jobs).to be_instance_of(Array)
      expect(all_jobs.count).to be > 100
    end
    it "should allow a get request that retrieves a specific resource" do
      @resource.id = "8498661"
      one_job = @resource_interface.get
      expect(one_job).to be_instance_of(Hash)
      expect(one_job["id"]).to eq(8498661)
    end
  end

  context 'when a resource_interface is initialized with a tag' do
    context "for get requests" do
      before(:each) do
        @resource = Servicetrade::TagInterface.new
        @resource_interface = Servicetrade::ApiInterface.new(@resource, @sa)
      end
      it "should allow a tag @resource class" do 
        expect(@resource_interface.url).to eq("https://api.servicetrade.com/api/tag")
      end
      it "should allow a get request that retrieves multiple @resources" do
        all_tags = @resource_interface.get
        expect(all_tags).to be_instance_of(Array)
        expect(all_tags.count).to be > 1
      end
      it "should allow a get request that retrieves a specific @resource" do
        @resource.id = "166721"
        one_tag = @resource_interface.get
        expect(one_tag).to be_instance_of(Hash)
        expect(one_tag["id"]).to eq(166721)
      end
    end
    context "for post requests" do
      before(:each) do
        @resource = Servicetrade::TagInterface.new
        @resource_interface = Servicetrade::ApiInterface.new(@resource, @sa)
      end
      it "should allow post with no entity params" do
        new_tag = @resource_interface.post({name: "MyTestTagNSSnoEnt"})
        expect(new_tag["response_code"]).to eq (200)
      end
      it "should allow post with entity params" do
        new_tag = @resource_interface.post({name: "MyTestTagNSS100withEnt", entityId: 7927482, entityType: 3})
        puts new_tag
        expect(new_tag["response_code"]).to eq (200)
      end
    end

    context "for put requests" do
      before(:each) do
        @resource = Servicetrade::LocationInterface.new
        @resource_interface = Servicetrade::ApiInterface.new(@resource, @sa)
        @resource.id = 2138230
      end
      it "should allow put with no entity params" do
        location = @resource_interface.put({})
        expect(location["taxable"]).to be (false)
      end
      it "should allow put with entity params" do
        new_tag = @resource_interface.put({taxable: true})
        expect(new_tag["taxable"]).to be (true)
      end
      it "should change back" do
        new_tag = @resource_interface.put({taxable: false})
        expect(new_tag["taxable"]).to be (false)
      end
    end
  end

end
