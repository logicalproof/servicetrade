require "spec_helper"

RSpec.describe Servicetrade::LocationInterface do
  resource = Servicetrade::LocationInterface.new
  context "when a Location is created" do
    it "should return a list of allowed verbs" do
      expect(resource.allowed_verbs).to eq(["GET", "POST", "PUT", "DELETE"])
    end
    it "should return a resource url without an id" do
      expect(resource.base_url).to eq("/location")
    end
  end

  context "post_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.post_params).to be_instance_of(Hash)
    end
    it "should include the companyId optional as false" do
      expect(resource.post_params[:companyId][:optional]).to eq(false)
    end
  end

  context "put_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.put_params).to be_instance_of(Hash)
    end
    it "should include the companyId optional as true" do
      expect(resource.put_params[:companyId][:optional]).to eq(true)
    end
  end

  context "get_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.get_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(resource.get_params[:autoAssignContract]).to eq(nil)
    end
    it "should include allowed values for companyStatus" do
      expect(resource.get_params[:companyStatus][:allowed_values]).to eq(['active', 'inactive', 'pending'])
    end
  end

end