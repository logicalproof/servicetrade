require "spec_helper"

RSpec.describe Servicetrade::Resource do
  context "when a resource is created" do
    it "should require a specific resource as an argument" do
      resource = Servicetrade::Resource.new(Servicetrade::Tag.new)
      expect(resource).to be_instance_of(Servicetrade::Resource)
    end
  end

  context "after instantiation" do
    resource = Servicetrade::Resource.new(Servicetrade::Tag.new)
    it "should respond to url" do
      expect(resource.url).to eq("/tag")
    end
    it "should respond to name" do
      expect(resource.name).to eq("tags")
    end
    it "should return an id if one is given" do
      resource.id = 12345
      expect(resource.id).to eq("12345")
    end
    it "should pass the allowed verbs" do
      expect(resource.allowed_verbs).to eq(["GET", "POST", "PUT", "DELETE"])
    end
  end

end