require "spec_helper"

RSpec.describe Servicetrade::Tag do
  resource = Servicetrade::Tag.new
  context "when a tag is created" do 
    it "should return a list of allowed verbs" do
      expect(resource.allowed_verbs).to eq(["GET", "POST", "PUT", "DELETE"])
    end
    it "should return a resource url without an id" do
      expect(resource.url).to eq("/tag")
    end
  end

  context "list_post_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.list_post_params).to be_instance_of(Hash)
    end
    it "should include the entityType entry" do
      expect(resource.list_post_params[:entityType][:type]).to eq("integer")
    end
  end

  context "list_put_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.list_put_params).to be_instance_of(Hash)
    end
    it "should include the entityType entry" do
      expect(resource.list_put_params[:entityType][:type]).to eq("integer")
    end
  end

  context "list_get_params" do
    it "should respond with a hash of param names and types" do
      expect(resource.list_get_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(resource.list_get_params[:autoAssignContract]).to eq(nil)
    end
    it "should include boolean for counts :type" do
      expect(resource.list_get_params[:counts][:type]).to eq("boolean")
    end
  end
end
