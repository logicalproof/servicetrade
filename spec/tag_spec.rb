require "spec_helper"

RSpec.describe Servicetrade::Tag do

  context "when a tag is created with an id" do
    resource = Servicetrade::Tag.new("8498661")
    it "should allow return the optional id" do
      expect(resource.id).to eq("8498661")
    end
    it "should return a resource url with an id" do
      expect(resource.url).to eq("/tag/8498661")
    end
    it "should return a list of allowed verbs with a resource id" do
      expect(resource.allowed_verbs).to eq(["GET", "POST", "PUT", "DELETE"])
    end
  end
 
  context "when a tag is created without an id" do
    resource = Servicetrade::Tag.new()
    it "should allow respond with a blank id" do
      expect(resource.id).to eq("")
    end
    it "should return a resource url without an id" do
      expect(resource.url).to eq("/tag")
    end
    it "should return a list of allowed verbs without a resource id" do
      expect(resource.allowed_verbs).to eq(["GET", "POST", "PUT", "DELETE"])
    end
  end

  context "list_post_params" do
    it "should respond with a hash of param names and types" do
      expect(Servicetrade::Tag.list_post_params).to be_instance_of(Hash)
    end
    it "should include the entityType entry" do
      expect(Servicetrade::Tag.list_post_params[:entityType][:type]).to eq("integer")
    end
  end

  context "list_put_params" do
    it "should respond with a hash of param names and types" do
      expect(Servicetrade::Tag.list_post_params).to be_instance_of(Hash)
    end
    it "should include the entityType entry" do
      expect(Servicetrade::Tag.list_post_params[:entityType][:type]).to eq("integer")
    end
  end

  context "list_get_params" do
    it "should respond with a hash of param names and types" do
      expect(Servicetrade::Tag.list_get_params).to be_instance_of(Hash)
    end
    it "should not include the autoAssignContract entry" do
      expect(Servicetrade::Tag.list_get_params[:autoAssignContract]).to eq(nil)
    end
    it "should include boolean for counts :type" do
      expect(Servicetrade::Tag.list_get_params[:counts][:type]).to eq("boolean")
    end
  end


end
