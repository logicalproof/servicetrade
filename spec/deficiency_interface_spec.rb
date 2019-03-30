require "spec_helper"

RSpec.describe Servicetrade::DeficiencyInterface do
  resource = Servicetrade::DeficiencyInterface.new
  context "when a deficiency is created" do
    it "should return a list of allowed verbs" do
      expect(resource.allowed_verbs).to eq(["GET", "POST", "PUT", "DELETE"])
    end
    it "should return a resource url without an id" do
      expect(resource.base_url).to eq("/deficiency")
    end
  end
  context "post_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.post_params).to be_instance_of(Hash)
    end
    it "should include the autoAssignContract entry" do
      expect(resource.post_params[:assetID][:type]).to eq("integer")
    end
  end

  context "put_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.put_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(resource.put_params[:assetID]).to eq(nil)
    end
  end

  context "get_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.get_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(resource.get_params[:autoAssignContract]).to eq(nil)
    end
    it "should include allowed values for status" do
      expect(resource.get_params[:status][:allowed_values]).to eq(["new","invalid","verified","fixed"])
    end
  end
end


