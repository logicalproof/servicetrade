require "spec_helper"

RSpec.describe Servicetrade::TagInterface do
  resource = Servicetrade::TagInterface.new
  context "when a tag is created" do 
    it "should return a list of allowed verbs" do
      expect(resource.allowed_verbs).to eq(["GET", "POST", "PUT", "DELETE"])
    end
    it "should return a resource url without an id" do
      expect(resource.base_url).to eq("/tag")
    end
  end

  context "post_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.post_params).to be_instance_of(Hash)
    end
    it "should include the entityType entry" do
      expect(resource.post_params[:entityType][:type]).to eq("integer")
    end
  end

  context "put_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.put_params).to be_instance_of(Hash)
    end
    it "should include the entityType entry" do
      expect(resource.put_params[:entityType][:type]).to eq("integer")
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
      expect(resource.get_params[:counts][:type]).to eq("boolean")
    end
  end
end
